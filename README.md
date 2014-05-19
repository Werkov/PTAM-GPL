PTAM-GPL
========

PTAM (Parallel Tracking and Mapping) re-released under GPLv3.

What is PTAM
------------

PTAM is a monocular SLAM (Simultaneous Localization and Mapping) system useful for real-time
6-DOF camera tracking in small scenes. It was originally developed as a research system in the Active 
Vision Laboratory of the University of Oxford, as described in the following papers:

- Georg Klein and David Murray, "Parallel Tracking and Mapping for Small AR Workspaces", Proc. ISMAR 2007
- Georg Klein and David Murray, "Improving the Agility of Keyframe-based SLAM", Proc. ECCV 2008


Previous PTAM release
---------------------

PTAM was initially released in 2008 by Isis Innovation under a license suitable for
academic use. That version is also available for commercial use subject to a license
agreement with Isis Innovation. That version remains available here:
http://www.robots.ox.ac.uk/~gk/PTAM/

This code represents a re-licensed fork of Isis Innovation's PTAM Source Code Release v1.0-r114.


Bug fixing, new features, and branches
--------------------------------------

If you have a version of PTAM with changes that you would like to merge into this master version, please send a pull or patch request.

Requests will be placed in their own branch for review and testing. Therefore, branches may or may not work. Branches will eventually be merged into the master once we have had time to review and test.

Compilation and dependencies with cmake
---------------------------------------

Dependencies are:
- TooN (header only): library for numerical calculations
- gvars: library for configuration loading
- cvd: light weight computer vision library

They are included as submodules (referencing not the current upstream version
but the one that PTAM is compatible with). Their source tree is in
'ThirdParty/Src' and they are configured to be installed into
'ThirdParty/Build' directory.

Run these commands in each library source directory:

	./xcs-configure.sh
	make install

In this order (it's important): TooN, gvars, libcvd.

PTAM itself is built with cmake.

