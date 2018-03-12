## Succinct version of questions 8-10

## Load bio3d
library(bio3d)

#Generating a heatmap
par(mai=c(8, 3, 9, 1))
alnment.heatmap <- pheatmap(aln.kcnh2.mat, 
                            color = viridis(200), 
                            cellwidth = 20,
                            cellheight = 20,
                            fontsize = 8,
                            filename = "~/Dropbox/bimm143_rproj/find_a_gene/aln_heatmap.jpg")


## Perform pdb.blast() on the human kcnh2 sequence obtained via accession number
human.seq <- "AAI27674.1"
kcnh2.pdb <- blast.pdb(human.seq)
head(kcnh2.pdb)
str(kcnh2.pdb)

## Trim down the blast.pdb object to contain only the pdb ids and evalues

View(kcnh2.pdb)
kcnh2.pdb.trim <- kcnh2.pdb$hit.tbl[ , c("identity", "s.end")]
kcnh2.pdb.trim

## Call pdb.annotate() on the human kcnh2 sequence; select the desired data columns
pdb.ids <- kcnh2.pdb$hit.tbl$subjectids
kcnh2.anno <- pdb.annotate(pdb.ids, anno.terms = c("structureId", 
                                                     "experimentalTechnique",
                                                     "source",
                                                     "resolution"))
head(kcnh2.anno)

# Bind the anno and trimmed matrices together

kcnh2.full.anno <- cbind(kcnh2.anno, kcnh2.pdb.trim)
head(kcnh2.full.anno)

## Select three unique hits

pdb.unique <- kcnh2.full.anno[c("5VA1", "5K7L", "5U6O_A"), ]
pdb.unique

## Rename columns to reflect evalue

colnames(pdb.unique) <- c("structureId", 
                           "experimentalTechnique", 
                           "source",
                           "resolution",
                           "identity",
                           "evalue")

pdb.unique

## Generate molecular figure of 5VA1 structure in VMD

hum.kcnh2.str <- read.pdb("5VA1")
write.pdb(hum.kcnh2.str)

## display conserved sequence between 5VA1 and "novel"
## Locate the accession number for 5VA1

kcnh2.pdb$hit.tbl[1,]

## AN is the same as for the original human sequnece. 
## compare this sequence to the 'novel' nemata sequence: novel.seq vs human.seq

novel.seq <- read.fasta("jk291807.1.fasta")



