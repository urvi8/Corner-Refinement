/**
main.cpp
Purpose: main file for performing corner refinement on biased corner detection.
Reads input image and harris radius from the command line.

@author Urvi Desai
@version 1.0 04/02/2018
*/

#include "detectharriscorners.h"
#include "computeedge.h"
#include "refinecorners.h"

#include <iostream>
#include <cstdlib>
#include <vector>

#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"

int main( int argc, char** argv ) {
  
  cv::Mat img = cv::imread( argv[1] );
  if( !img.data ) {
    return -1;
  }

  const int harrisRadius = atoi(argv[2]);
    
  DetectHarrisCorners cornerDetector;                                                 // Create Objects 
  ComputeEdge edgeDetector;
  RefineCorners refine;

  cv::Mat imEdge = edgeDetector.detectEdge( img );                                   // Run process
  cornerDetector.findCorners( harrisRadius, img );
  refine.process( harrisRadius, edgeDetector, cornerDetector );

  for( int i = 0; i < refine.actualCorners.size(); i++ ) {                           // Plot results
    circle( img, refine.actualCorners[i], 1, cv::Scalar(0,0,255), 2, 8, 0 );
    circle( img, cornerDetector.harrisCorners[i], 1, cv::Scalar(255,0,0), 2, 8, 0 );
  }

  cv::namedWindow( "Refined Corner Detection", CV_WINDOW_AUTOSIZE );                  // Visualize results 
  cv::imshow( "Refined Corner Detection", img );
  cv::imwrite( "./test_result.jpg", img );
  cv::waitKey(0);  
  
  return 0;
}

