# Transfer learning using the TF object detection API


|   Platform |   Hardware	|  Dependencies 	|
|---	|---	|---	|
|   :white_square_button: Linux	|   :white_square_button: Azure Kinect 	| :white_square_button: [ gflags](https://github.com/gflags/gflags)	|
|| |  :white_square_button: [ glog ](https://github.com/google/glog)  	|
||| :white_square_button:  [ Azure Kinect SDK ](https://github.com/microsoft/Azure-Kinect-Sensor-SDK) |
||| :white_square_button:  [ opencv ](https://github.com/opencv/opencv) |
||| :white_square_button:  [ Anaconda ](https://www.anaconda.com/products/individual) |
||| :white_square_button:  [ Tensor Flow models ](https://github.com/tensorflow/models) |
||| :white_square_button:  [ Image annotation tool ](https://github.com/tzutalin/labelImg) |

This project is made up of two sub-projects: The image-capturing and model-training sub-project. [`image-capturing`](./image-capturing) is a CMake project that uses Microsoft's Azure Kinect to capture so-called depth color images (of cause, this can be changed). [`model-training`](./model-training) uses shell and python scripts to exploit Tensor Flow's object detection API and train an object detection model using transfer learning. The notebooks in model-training are self-documenting, but more on that in the [`model-training README.md`](./model-training/README.md).

