#!/bin/bash

cat draw_qq.R | R --vanilla --args $1 $2 $3
