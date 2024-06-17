;; Inspired by https://simonsafar.com/2024/whisper/

(defvar ok-whisper--ffmpeg-process nil)
(defvar ok-whisper--temp-file nil)

(defun ok-whisper--record-dwim ()
  (interactive)
  (if (not ok-whisper--ffmpeg-process)
      (ok-whisper--start-recording)
    (ok-whisper--stop-recording)))

(defun ok-whisper--start-recording ()
  (setq ok-whisper--temp-file (make-temp-file "voice_temp" nil ".mp3"))
  (message "Temporary file created at: %s" ok-whisper--temp-file)
  (let* ((proc (start-process-shell-command
                "voice ffmpeg" "*ffmpeg*"
                (format "ffmpeg -y -t 60 -f pulse -i default %s" ok-whisper--temp-file))))
    (setq ok-whisper--ffmpeg-process proc)
    (message "Recording...")
    (set-process-sentinel proc 'ok-whisper--recording-sentinel)))

(defun ok-whisper--stop-recording ()
  (interrupt-process ok-whisper--ffmpeg-process)
  (message "Stopped recording"))

(defun ok-whisper--recording-sentinel (proc event)
  (setq ok-whisper--ffmpeg-process nil)
  (if (memq (process-exit-status proc) '(2 255))
      (progn
        (message "Finished recording; sending to Whisper...")
        (ok-whisper--call-openai-whisper ok-whisper--temp-file))
    (message "Something went wrong with the process")))

(defun ok-whisper--call-openai-whisper (audio-path)
  (unless openai-token
    (error "No API token available"))
  (let* ((command (format "curl -s https://api.openai.com/v1/audio/transcriptions \
-H \"Authorization: Bearer %s\" \
-H \"Content-Type: multipart/form-data\" \
-F file=\"@%s\" \
-F model=\"whisper-1\""
                          openai-token
                          audio-path))
         (response (shell-command-to-string command))
         (transcription (cdr (assoc 'text (json-read-from-string response)))))
    (message "Transcription result: %s" transcription)
    (insert transcription)
    (delete-file audio-path)))
