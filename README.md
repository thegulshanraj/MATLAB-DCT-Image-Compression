# MATLAB-DCT-Image-Compression

## Image Compression using DCT and IDCT in MATLAB

This MATLAB project is designed to illustrate the concept of image compression using Discrete Cosine Transform (DCT) and its inverse (IDCT). Image compression is a crucial technique employed to reduce the storage space required for digital images while maintaining an acceptable level of visual quality. DCT-based compression methods, commonly used in image and video coding standards like JPEG and MPEG, transform image data from the spatial domain to the frequency domain, facilitating efficient compression through quantization of frequency coefficients.

**Files:**

1. **bloc_dct8_normq.m**: This file encapsulates the core functionality of the compression algorithm. The `bloc_dct8_normq` function performs the following operations:
   - Applies 8x8 DCT2 transformation to image blocks.
   - Normalizes the transformed coefficients.
   - Quantizes the coefficients based on a predefined quantization matrix and a user-defined parameter `Qpk`.
   - De-normalizes the quantized coefficients.
   - Performs inverse DCT to reconstruct the image block.

2. **ExDCTencoding.m**: This script provides a user-friendly interface to interact with the compression algorithm. It performs the following tasks:
   - Loads an image (in grayscale or color) and pads it to ensure its dimensions are multiples of 8x8 pixels.
   - Displays the original image.
   - Creates a slider for adjusting the compression quality (controlled by the parameter `Qpk`).
   - Displays the reconstructed image corresponding to the selected `Qpk` value.

**Usage:**

1. **Environment Setup:**
   - Ensure MATLAB is installed on your system.
   - Clone or download the project repository from GitHub.

2. **Running the Project:**
   - Save the file `bloc_dct8_normq.m`.
   - Run the file `ExDCTencoding.m`.
   - If using a custom image, place it in the same directory as the project files or provide the correct path in the code.

3. **Interacting with the Interface:**
   - Upon execution, a figure window will open displaying the original image.
   - Use the slider to adjust the compression quality (`Qpk` parameter).
   - The reconstructed image corresponding to the chosen `Qpk` value will be displayed in the same figure window.

4. **Understanding the Output:**
   - Altering the slider value modifies the compression level, impacting the visual quality of the reconstructed image.
   - When the `Qpk` value is lower, it results in superior image quality, but the trade-off is larger file sizes. On the other hand, a higher `Qpk` value leads to greater compression ratios, which can cause a loss in image details, but results in smaller file sizes.

5. **Additional Notes:**
   - This project serves as a practical demonstration of DCT-based image compression techniques.
   - Further enhancements or optimizations can be explored based on specific application requirements.
   - Consider integrating the provided functions into larger projects or experimenting with different quantization matrices for varying compression effects.

**References:**
- MATLAB documentation for DCT and IDCT functions.
- Image Processing Made Easy by Prof. Sandeep Hiremath @MathWorks ( https://in.mathworks.com/videos/image-processing-made-easy-81718.html )

**Author:**
- Gulshan Raj ( thegulshanraj@gmail.com )
