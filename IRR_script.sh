# calculate pp
fslmaths trace_1.nii.gz -add trace_2.nii.gz trace_union
trace_union -thr 2 trace_pp
fslstats trace_pp -V


# calculate nn
bet FA.nii.gz FA_bet -f .5
fslstats FA_bet.nii.gz -V
fslstats trace_union.nii.gz  -V
# subtract union from bet for nn


# calcualte np, pn
fslmaths trace_union.nii.gz -bin trace_union_bin
fslmaths trace_union_bin.nii.gz -sub trace_1.nii.gz  trace_np
fslmaths trace_union_bin.nii.gz -sub trace_2.nii.gz  trace_pn
fslstats trace_pn.nii.gz -V
fslstats trace_np.nii.gz -V