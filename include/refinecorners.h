#ifndef REFINE_CORNERS
#define REFINE_CORNERS
#define _USE_MATH_DEFINES

#include <iostream>
#include <cmath>
#include <numeric>
#include <vector>

#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"

class RefineCorners {

  private:
    std::vector<cv::Point> windowPoints;
    std::vector<cv::Point> edgePoints;
    std::vector<int> edgeIntensity;
    cv::Vec2f line;
        
    void createWindow( const int harrisRadius, const cv::Point );
    std::vector<int> sortIndx( const std::vector<int> &v );
    void selectEdgePixels( const int harrisRadius, const ComputeEdge &edgeObj ); 
    void fitLine(const DetectHarrisCorners &cornerObj, const cv::Point cornerPoint );
    cv::Point findAcutalCorner(const DetectHarrisCorners &cornerObj, const cv::Point cornerPoint );
  
  public:
    std::vector<cv::Point> actualCorners;
    
    void process( const int harrisRadius, const ComputeEdge &edgeObj, const DetectHarrisCorners &cornerObj );
        
};

#endif

