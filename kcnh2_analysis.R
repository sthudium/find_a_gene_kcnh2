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


## Perform hmmer search in order to obtain e values for the 
alnment.kcnh2 <- read.fasta("~/Dropbox/bimm143_rproj/find_a_gene/muscle_aln_kcnh2_trim")

hum.seq.kcnh2 <- get.seq("AAI27674.1")
hum.seq.kcnh2




## pdb blast on human sequence for kcnh2
kcnh2.blastx2 <- blast.pdb("AAI27674.1")
tmp <- kcnh2.blastx2$hit.tbl$subjectids

kcnh2.pdb.blast <- pdb.annotate(tmp)
View(kcnh2.pdb.blast)

kcnh2.pdb.blast[, "source" == "Homo sapiens"]

## generate consensus sequence from muscle alignment and then call hmmer

aln.kcnh2 <- read.fasta("~/Dropbox/bimm143_rproj/find_a_gene/muscle_aln_kcnh2_trim")
cons.kcnh2 <- consensus(aln.kcnh2)

kcnh2.hmmr <- hmmer(hum.seq.kcnh2)
kcnh2.hmmr


kcnh2.blastx2

## e-values in 