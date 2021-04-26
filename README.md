# ForgeGradle example runner

The project to set up, build, and run [ForgeGradle-example] on clean environment.

To do this, this project provides Dockerfile.

## How to run
For posix environment

1. `git clone https://github.com/anatawa12/ForgeGradle-example-runner`
1. `cd ForgeGradle-example-runner`
1. `./run_on_docker.sh`.

By default, this image uses `setupDecompWorkspace` for configure workspace.
if you want to use other setup tasks like `setupCiWorkspace`, 
run `./run_on_docker.sh <setup-task-name>` like `./run_on_docker.sh setupCiWorkspace`

[ForgeGradle-example]: https://github.com/anatawa12/ForgeGradle-example
