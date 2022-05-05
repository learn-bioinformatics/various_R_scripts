#!/usr/bin/bash
module load R
R -q -f render_r_markdown.R --args $@
