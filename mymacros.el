(fset 'insert-package-name
   [?\S-\C-e ?\M-w ?\M-x ?e ?l ?- ?g ?e ?t ?- return ?\C-y return ?\C-s ?d ?e ?s ?c ?r ?i ?\C-m ?\M-f ?\S-\C-e ?\M-w ?\C-x ?b return ?\C-y ?\C-a down ?\M-f C-left])

(fset 'get-package-description
   [?\S-\C-e ?\s-c ?\M-x ?e ?l ?- ?g ?e ?t ?- ?f ?i ?n ?d ?- ?r ?e ?c ?i return ?\C-y return ?\M-x ?g ?o ?t ?o ?- ?l ?o ?m backspace backspace ?i ?n ?e return ?0 return ?\C-s ?d ?e ?s ?c ?r ?i ?p ?t ?\C-m ?\C-s ?\" ?\C-m ?\S-\C-e left ?\M-x return ?0 return ?\C-s ?d ?e ?s ?c ?r ?i ?p ?t ?\C-m ?\C-s ?\" ?\C-m ?\S-\C-e C-S-left C-S-right S-left ?\s-c ?\C-x ?b return ?  ?  ?\; ?  ?\C-y])

(defun insert-pretty-kbd-macro (macro-name)
  (interactive (list (intern (completing-read
                              "Insert kbd macro (name): "
                              obarray
                              (lambda (elt)
                                (and (fboundp elt)
                                     (or (stringp (symbol-function elt))
                                         (vectorp (symbol-function elt))
                                         (get elt 'kmacro))))
                              t))))
  (interactive)
  (insert "(fset '")
  (prin1 macro-name (current-buffer))
  (insert "\n   (kbd \"")
  (insert (key-description (symbol-function macro-name)))
  (insert "\"))\n"))


(fset 'get-package-description
   (kbd "C-S-e s-c M-x e l - g e t - f i n d - r e c i p e - f i l e <return> C-y <return> M-x g o t o - l i n e <return> 0 <return> C-s d e s c r i p t i o n RET C-s \" RET C-S-e s-c C-x b <return> SPC SPC ; SPC C-y"))

;; Fix kmacro-edit-lossage, it's normal implementation is bound tightly to C-hl
(defun kmacro-edit-lossage ()
  "Edit most recent 300 keystrokes as a keyboard macro."
  (interactive)
  (kmacro-push-ring)
  (edit-kbd-macro 'view-lossage))
