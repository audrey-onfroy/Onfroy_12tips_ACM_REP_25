### Twelve tips for reproducible analysis of single-cell transcriptomics data

This repository contains the code to process the six scRNA-Seq samples from the OEP002321 dataset. This dataset was originally published by S. Wu and colleagues (2022) (DOI: [10.1038/s41421-022-00394-2](https://doi.org/10.1038/s41421-022-00394-2)). The re-analysis of this dataset, from the count matrices, illustrates **twelve tips for reproducible analysis of single-cell transcriptomics data**. To read the analysis, please open `index.html` file in any browser.

*Note*: For the double-blind review of the article, links redirecting to Github or Zenodo are anonymised by using Google Drive.

### Reproduce the analysis

#### Input data

The count matrices can be found in Zenodo (Record ID: XXanonymousXX). \
Link: [https://drive.google.com/drive/folders/1waBQttYyOxgtri8bxuW-ja-S4WCXiFFV]()

The Apptainer container can be found in Zenodo (Record ID: XXanonymousXX). \
Link: [https://drive.google.com/drive/folders/1hvShyX89Usm1fXDafPGZxdaJPHKtcaKk]()

#### Steps to reproduce the analysis

Follows these 6 steps to reproduce the analysis:

1. Clone locally this Github repository
2. Make an `input` folder in the `2_individual` folder
3. Download the count matrices and organise the `input` folder as follows:

```
.
├── F18
│   └── raw_feature_bc_matrix
│       ├── barcodes.tsv.gz
│       ├── features.tsv.gz
│       └── matrix.mtx.gz
├── F31B
│   └── raw_feature_bc_matrix
│       ├── barcodes.tsv.gz
│       ├── features.tsv.gz
│       └── matrix.mtx.gz
├── F31W
│   └── raw_feature_bc_matrix
│       ├── barcodes.tsv.gz
│       ├── features.tsv.gz
│       └── matrix.mtx.gz
├── F59
│   └── raw_feature_bc_matrix
│       ├── barcodes.tsv.gz
│       ├── features.tsv.gz
│       └── matrix.mtx.gz
├── F62B
│   └── raw_feature_bc_matrix
│       ├── barcodes.tsv.gz
│       ├── features.tsv.gz
│       └── matrix.mtx.gz
└── F62W
    └── raw_feature_bc_matrix
        ├── barcodes.tsv.gz
        ├── features.tsv.gz
        └── matrix.mtx.gz
```

4. Open the `knit_all.sh` file and edit the paths to the Apptainer container (line 4) and the analysis directory (line 5)
5. Ensure to install Apptainer. Note that the versions `singularity version 3.8.7` and `singularity version 3.8.3` were used to compile the analysis
6. Run the `knit_all.sh` file in a terminal:

```
bash knit_all.sh
```

### Resource requirement

Using the `time` bash tool from David Keppel, David MacKenzie, and Assaf Gordon, installed using the `apt-get -y install time` command, the `/usr/bin/time -v bash knit_all.sh` command output the following summaries, reshaped in a table and excluding 0 values:

|                                    |     Machine 1     |     Machine 2     |
|------------------------------------|------------------:|------------------:|
| User time (seconds)                |     19608.27      | 17160.05          |
| System time (seconds)              |      260.83       | 153.05            |
| Percent of CPU this job got        |       211%        | 213%              |
| Elapsed (wall clock) time (h:mm:ss or m:ss) | 2:36:20  | 2:14:58           |
| Maximum resident set size (kbytes) |     8796520       | 8797788           |
| Major (requiring I/O) page faults  |      7030         | 13396             |
| Minor (reclaiming a frame) page faults |  137515231    | 88089813          |
| Voluntary context switches         |      189139       | 171858            |
| Involuntary context switches       |      230109       | 63444             |
| File system inputs                 |     4161632       | 3953590           |
| File system outputs                |     1954984       | 1954984           |
| Page size (bytes)                  |       4096        | 4096              |

The machine characteristics are:

|                     |             Machine 1             |          Machine 2          |
|---------------------|----------------------------------:|----------------------------:|
| processor           | Intel(R) Xeon(R) Silver 4214R CPU | Intel(R) Xeon(R) W-2133 CPU |
| number of cores     |               48                  |             12              |
| number of threads per core |           2                |              2              |
| frequency           |              2.4 GHz              |           3.6 GHz           |
| RAM                 |              132 GB               |            64 GB            |
| operating system    |          Ubuntu 24.04 LTS         |       Ubuntu 20.04 LTS      |
| Singularity version |              3.8.7                |            3.8.3            |

### Additional resources

#### Conversion of the present README

This README was converted into an HTML file using the `pandoc` version 3.1.3 and the following command:

```
pandoc -f markdown README.md > README.html
```

#### Construction of the index.html page

The index.html page was initiated using the OrganizeHTML tool. \
URL: [https://drive.google.com/drive/folders/1TFn_Sz8i3_Yv4R-zSnhpIBStOhRqRnsw]()

It was then customised using Visual Studio Code. Particularly, we make the README.html file accessible from the index.html menu.

#### Customatisation of the icon

When opening the index.html page in a Web browser, an icon "favicon" is displayed in the tab. The original image has been automatically build and saved during the compilation of the figures.Rmd notebook in the `figures_detail` folder, under the name `favicon-1.png`. The background of the image has been removed using the [remove.bg](https://www.remove.bg/) website. The PNG to ICO generator of the [favicon.io](https://favicon.io/) has been used to convert the PNG picture to the ICO format. In the download zip folder, the `favicon.ico` image has been selected to be save in the `index_layout` > `logo` folder.

