[![License: CC BY-NC](https://img.shields.io/badge/Licence-CC_BY--NC--4.0-blue?logo=creativecommons&logoColor=white)](https://creativecommons.org/licenses/by-nc/4.0/)
[![DOI](https://img.shields.io/badge/DOI-10.5281/zenodo.15591926-blue)](https://doi.org/10.5281/zenodo.15591926)

### Twelve tips for reproducible analysis of single-cell transcriptomics data

This repository contains the code to process the six scRNA-Seq samples from the OEP002321 dataset. This dataset was originally published by S. Wu and colleagues (2022) (DOI: [10.1038/s41421-022-00394-2](https://doi.org/10.1038/s41421-022-00394-2)). The re-analysis of this dataset, from the count matrices, illustrates **twelve tips for reproducible analysis of single-cell transcriptomics data**. To navigate through the analysis, please open [index.html](https://audrey-onfroy.github.io/Onfroy_12tips_ACM_REP_25/).

### Reproduce the analysis

#### Input data

The count matrices can be found in Zenodo (Record ID: [15103193](https://zenodo.org/records/15103193)). \
Link: [doi.org/10.5281/zenodo.15103192](https://doi.org/10.5281/zenodo.15103192)

The Apptainer container (V1) can be found in Zenodo (Record ID: [15512051](https://zenodo.org/records/15512051)). \
Link: [doi.org/10.5281/zenodo.15512051](https://doi.org/10.5281/zenodo.15512051)

#### Steps to reproduce the analysis

Follows these 6 steps to reproduce the analysis:

1. Clone locally this Github repository
2. Make an `input` folder in the `2_individual` folder
3. Download the count matrices on Zenodo.  The `2_individual/input` folder must contain the input data organised as follows:

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

Note: It is possible to have additional files or folder in each sample-named folder (eg. `web_summary.html`). However, the `raw_feature_bc_matrix` must respect the organisation above, including file names, because the data are read from there.

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

The index.html page was initiated using the OrganizeHTML tool (V2), which is accessible in Zenodo (Record ID: [15114752](https://zenodo.org/records/15114752)) \
Link: [doi.org/10.5281/zenodo.15114752](https://doi.org/10.5281/zenodo.15114752)

It was then customised using Visual Studio Code.

#### Customatisation of the icon

When opening the index.html page in a Web browser, an icon "favicon" is displayed in the tab. The original image has been automatically build and saved during the compilation of the figures.Rmd notebook in the `figures_detail` folder, under the name `favicon-1.png`. The background of the image has been removed using the [remove.bg](https://www.remove.bg/) website. The PNG to ICO generator of the [favicon.io](https://favicon.io/) has been used to convert the PNG picture to the ICO format. In the download zip folder, the `favicon.ico` image has been selected to be save in the `index_layout` > `logo` folder.

## How to cite

To cite the original publication behind the **data**, please use:

> S. Wu *et al*, Single-cell transcriptomics reveals lineage trajectory of human scalp hair follicle and informs mechanisms of hair graying, Cell Discovery, 2022, DOI: 10.1038/s41421-022-00394-2

To cite the R packages and **other tools**, please refer to original publications.

To cite this work (directory tree, modular files organisation, methodological approach to enable **reproducibility**...), please use:

> Onfroy *et al.*, Twelve Tips for Reproducible Analysis of Single-Cell Transcriptomics Data, ACM REP '25; doi: 10.1145/3736731.3746138


| ![CC](https://upload.wikimedia.org/wikipedia/commons/d/d3/Cc_by-nc_icon.svg) | Except where otherwise noted, this work is licensed under <br> [https://creativecommons.org/licenses/by-nc/4.0/](https://creativecommons.org/licenses/by-nc/4.0/) |
|:----:|:---:|
