library(bio3d)

?muscle
??hmmer

?seqaln

aln.test <- read.fasta("~/Desktop/test_muscle_aln.fst")
head(aln.test)

## pdb search on novel protein instead of the human sequence

View(aln.kcnh2)

aln.kcnh2.cutoff <- aln.kcnh2$ali[ , unlist(consensus(aln.kcnh2))]
aln.kcnh2.consen <- consensus(aln.kcnh2)
aln.kcnh2.consen

kcnh2.blast <- blast.pdb("JK291807.1")

kcnh2.hmmr <- hmmer(aln.kcnh2, db = "nr")
kcnh2.hmmr

kcnh2.blastx2 <- blast.pdb("AAI27674.1")
kcnh2.blastx2$hit.tbl$subjectids
