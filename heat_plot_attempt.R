#清空之前所有环境
rm(list = ls())

#运行包
library(pheatmap)
library(vegan)

data <- read.table(file = "C:/Users/15234/Desktop/example.txt",
                   header=T,sep="\t",row.names=1)
frame_data <- as.data.frame(data)
data.1 <- decostand(frame_data,"standardize",MARGIN = 1)

p <- pheatmap(data.1, clustering_distance_rows = "correlation",
              clustering_distance_cols= "correlation",
              display_numbers = TRUE, number_color = "black",
              treeheight_row=100,treeheight_col=50,
              color = colorRampPalette(c("navy", "white", "firebrick3"))(50),
              border = TRUE, border_color = "black",
              cellwidth = 20, cellheight = 20,
              fontsize = 10, Number_format = "%.1f",
              legend_breaks = c(-2:2), 
              legend_labels = c("-1.0","0.0","1.0","2.0","3.0"))
print(p)