#!/bin/bash

#------------------------ Set variables
singularity_container="/home/nf1/Documents/Audrey/git_scripts/singularity/rpackages_dir/singularity_from_dir.simg"
analysis_dir="/home/nf1/Documents/Audrey/git_oep"

export APPTAINER_BIND="${analysis_dir}:${analysis_dir}"

#------------------------ Knit the notebooks from the OEP002321 dataset
# Metadata
singularity exec ${singularity_container} \
    Rscript -e "rmarkdown::render(input = '${analysis_dir}/1_metadata/1_build_metadata.Rmd',
                                  output_file = '${analysis_dir}/1_metadata/1_build_metadata.html')"

# Sample
for sample in $(ls -d ${analysis_dir}/2_individual/input/*/)
do
    sample=$(basename $sample)
    sample=${sample%/}
    echo $sample
    singularity exec ${singularity_container} \
    Rscript -e "rmarkdown::render(input = '${analysis_dir}/2_individual/1_make_individual.Rmd',
                                  output_file = '${analysis_dir}/2_individual/${sample}.html',
                                  params = list(sample_name = '${sample}'))"
done

# Combined
singularity exec ${singularity_container} \
    Rscript -e "rmarkdown::render(input = '${analysis_dir}/3_combined/1_combined_all.Rmd',
                                  output_file = '${analysis_dir}/3_combined/1_combined_all.html')"

# ORS and IFE basal
singularity exec ${singularity_container} \
    Rscript -e "rmarkdown::render(input = '${analysis_dir}/4_ors_ifeb/1_zoom_ors_ifeb_dataset.Rmd',
                                  output_file = '${analysis_dir}/4_ors_ifeb/1_zoom_ors_ifeb_dataset.html')"

singularity exec ${singularity_container} \
    Rscript -e "rmarkdown::render(input = '${analysis_dir}/4_ors_ifeb/2_zoom_ors_ifeb_analysis.Rmd',
                                  output_file = '${analysis_dir}/4_ors_ifeb/2_zoom_ors_ifeb_analysis.html')"

# Figures
singularity exec ${singularity_container} \
    Rscript -e "rmarkdown::render(input = '${analysis_dir}/5_figures/figures.Rmd',
                                  output_file = '${analysis_dir}/5_figures/figures.html')"
