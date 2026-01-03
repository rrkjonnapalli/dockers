#!/bin/bash
export HOST_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1)
