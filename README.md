# ASM2_WorkCV
18/05 fix upload image
error: 2 form detail and personal info is the same, it must use different js id for function upload. And the object set to session doesn't have field "iamge", because that its null when controller call object, and cannot display image
fix: remove detail form, add field "image" to function login that its save to session when user login