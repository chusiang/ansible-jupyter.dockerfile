#!/bin/sh
# ============================================================
#  Author: Chu-Siang Lai / chusiang (at) drx.tw
#  Blog: http://note.drx.tw
#  Filename: docker-entrypoint.sh
#  Modified: 2016-11-20 18:43
#  Description: Run the jupyter service.
#
#   --ip 0.0.0.0: Allow all IP access.
#   --no-browser: Don't open browser from command line.
#   --notebook-dir: Bunding the workdir.
#
# =========================================================== 

jupyter-notebook --ip 0.0.0.0 --no-browser --allow-root --notebook-dir=/home
