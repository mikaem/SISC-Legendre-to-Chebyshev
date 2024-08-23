#!/bin/bash
echo 'pyver=$(python -c "import sys;print(sys.version[:(len(str(sys.version_info.major))+len(str(sys.version_info.minor))+1)])")' >> ~/.bashrc
echo 'source activate l2copenblas' >> ~/.bashrc
echo 'export PATH=/workspaces/SISC-Legendre-to-Chebyshev/src/build-install/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/workspaces/SISC-Legendre-to-Chebyshev/src/build-install/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export PYTHONPATH=/workspaces/SISC-Legendre-to-Chebyshev/src/build-install/lib/python${pyver}/site-packages:$PYTHONPATH' >> ~/.bashrc
