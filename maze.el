(setq curx 3)
(setq cury 3)

(defun point-for-x-y (x y)
  (+ (* 18 (- y 1)) x))

(with-current-buffer (get-buffer-create "*Maze")
  (delete-region (point-min) (point-max))
  (insert-string "#################
")
  (insert-string "#               #
")
  (insert-string "#               #
")
  (insert-string "###########     #
")
  (insert-string "#         #     #
")
  (insert-string "#     #   #     #
")
  (insert-string "#     #   #     #
")
  (insert-string "# #########     #
")
  (insert-string "#               #
")
  (insert-string "#################
")
  (goto-char (point-for-x-y curx cury))
  (delete-char 1)
  (insert-string "@")
  )

(defun move-up ()
  (interactive)
  (with-current-buffer (get-buffer-create "*Maze")
    (let ((nexty (- cury 1))
          (nextx curx))
      (progn (save-excursion
               (goto-char (point-for-x-y nextx nexty))
               (if (eq (char-after) ?#)
                   (error "wall"))
               (goto-char (point-for-x-y curx cury))
               (delete-char 1)
               (insert-string " ")
               (goto-char (point-for-x-y nextx nexty))
               (delete-char 1)
               (insert-string "@"))
             (setq curx nextx)
             (setq cury nexty)
             (goto-char (point-for-x-y nextx nexty))))))


(defun move-down ()
  (interactive)
  (with-current-buffer (get-buffer-create "*Maze")
    (let ((nexty (+ cury 1))
          (nextx curx))
      (progn (save-excursion
               (goto-char (point-for-x-y nextx nexty))
               (if (eq (char-after) ?#)
                   (error "wall"))
               (goto-char (point-for-x-y curx cury))
               (delete-char 1)
               (insert-string " ")
               (goto-char (point-for-x-y nextx nexty))
               (delete-char 1)
               (insert-string "@"))
             (setq curx nextx)
             (setq cury nexty)
             (goto-char (point-for-x-y nextx nexty))))))


(defun move-left ()
  (interactive)
  (with-current-buffer (get-buffer-create "*Maze")
    (let ((nexty cury )
          (nextx (- curx 1)))
    (progn (save-excursion
             (goto-char (point-for-x-y nextx nexty))
             (if (eq (char-after) ?#)
                 (error "wall"))
             (goto-char (point-for-x-y curx cury))
             (delete-char 1)
             (insert-string " ")
             (goto-char (point-for-x-y nextx nexty))
             (delete-char 1)
             (insert-string "@"))
             (setq curx nextx)
             (setq cury nexty)
           (goto-char (point-for-x-y nextx nexty))))))

(defun move-right ()
  (interactive)
  (with-current-buffer (get-buffer-create "*Maze")
    (let ((nexty cury )
          (nextx (+ curx 1)))
    (progn (save-excursion
             (goto-char (point-for-x-y nextx nexty))
             (if (eq (char-after) ?#)
                 (error "wall"))
             (goto-char (point-for-x-y curx cury))
             (delete-char 1)
             (insert-string " ")
             (goto-char (point-for-x-y nextx nexty))
             (delete-char 1)
             (insert-string "@"))
             (setq curx nextx)
             (setq cury nexty)
           (goto-char (point-for-x-y nextx nexty))))))
