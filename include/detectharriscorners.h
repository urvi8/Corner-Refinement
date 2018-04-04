#ifndef UNWEIGHTED_HARRIS_CORNERS
#define UNWEIGHTED_HARRIS_CORNERS

#include <iostream>
#include <vector>

#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"


class DetectHarrisCorners {
  
  private:
    std::vector<cv::Point> cornerEstimates;    
    cv::Mat harrisValue; 

    void selectStrongest( const std::vector<cv::Point> &cornerEstimates, const cv::Mat &harrisValue );   
    
  public:
    std::vector<cv::Point> harrisCorners;

    void findCorners ( const int harrisRadius, const cv::Mat &img );

};

#endif // UNWEIGHTED_HARRIS_CORNERS
