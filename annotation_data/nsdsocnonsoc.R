# NeuroHackademy Hack Project #
#############################################
# Clean/Clear All
rm(list = ls())
dev.off(dev.list()["RStudioGD"])
options(scipen = 999)
options(digits = 4)
#############################################
# Load packages
library(irr)

# Set working directory
setwd("~/Desktop/conferences/neurohackademy 2022/hack project")

###########RECODE BY RATER###################
# Read in data
annotations <- read.csv("annotations.csv")

# Recode ratings for social/nonsocial
annotations$human[which(annotations$human == 'nonsocial')] <- "0"
annotations$human[which(annotations$human == 'social')] <- "1"
annotations$human <- as.factor(annotations$human)

annotations$coco[which(annotations$coco == 'nonsocial')] <- "0"
annotations$coco[which(annotations$coco == 'social')] <- "1"
annotations$coco <- as.factor(annotations$coco)

annotations$yolo[which(annotations$yolo == 'nonsocial')] <- "0"
annotations$yolo[which(annotations$yolo == 'social')] <- "1"
annotations$yolo <- as.factor(annotations$yolo)

##############INDIVIUDAL KAPPA###############

# Select the raters
annotations <- annotations[, 3:5]

# Compute kappa
kappam.fleiss(annotations) 
  #kappa = 0.869
