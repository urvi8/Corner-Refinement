# Corner Refinement

Understanding and improving biased behavior of corner detectors

## Background and Objective

Standard corner detectors e.g. Harris sometimes produce biased estimation of corners. These detectors detect actual corners under very specific conditions and are often not scale invariant. The goal is to understand why the detector mentioned above is biased and find an alternative which exhibits better behavior.

This project implements a corner refinement algorithm that processes window around each detected corner; fits a line to surrounding edge points and projects the actaul corner on the line. This is achieved by maximizing dot product relative to the line's tangent. 

### Example Result:
![alt text](https://github.com/urvi8/Corner-Refinement/blob/master/images/result1.jpg)

## Getting Started

#### Platform used: Ubuntu 14.04 LTS

## Dependencies
[OpenCV 2.4](https://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html)

## Installation

### Follow these steps to install and build the current project.

#### Clone the respository in desired directory

```
git clone http://github.com/urvi8/Corner-Refinement

```

#### Build package

```
mkdir build
cd build
cmake ..
```

#### Compile the project

```
make
```

#### Run executable

There will be three command line parameters:  _executable_    _path/to/test/image_    _sizeOfHarrisWindowRadius_

An example would be
```
CornerRefine  /home/user/Corner-Refine/test-image.png  7
``` 
The result will appear in a window and will be saved to the current directory.

## Built With

[CMake](https://cmake.org/install/)
