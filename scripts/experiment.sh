# ##############################
# ### Create the environment ###

# # Build basic Docker image on host
bash scripts/environment/host_build_docker_image_base.sh
echo "host_build_docker_image_base.sh done"

# # Export basic Docker image on host
# bash scripts/environment/host_export_docker_image_base.sh
# echo "host_export_docker_image_base.sh done"

# # Copy basic Docker image to servers
# bash scripts/environment/host_push_docker_image_base.sh
# echo "host_push_docker_image_base.sh done"

# Load basic Docker image on servers
bash scripts/environment/host_build_docker_image_ready_model.sh
echo "host_build_docker_image_ready_model.sh done"

# bash scripts/environment/host_build_docker_image_pipeswitch.sh
# echo "host_build_docker_image_pipeswitch.sh done"

# bash scripts/environment/host_build_docker_image_mps.sh
# echo "host_build_docker_image_mps.sh done"


# ### Create the environment END ###
# ##################################

# ####################
# ### Plot figures ###

mkdir output

echo "Warm up servers"
# Warm up servers
bash scripts/environment/host_run_warmup.sh

echo "Plot figure 5"
# PLot figure 5
bash scripts/figures/figure5/plot_figure.sh

echo "Plot figure 6"
# PLot figure 6
bash scripts/figures/figure6/plot_figure.sh

echo "Plot figure 7"
# PLot figure 7
bash scripts/figures/figure7/plot_figure.sh

echo "Plot figure 8"
# PLot figure 8
bash scripts/figures/figure8/plot_figure.sh

echo "Plot figure 9"
# PLot figure 9
bash scripts/figures/figure9/plot_figure.sh

# ### Plot figures END ###
# ########################