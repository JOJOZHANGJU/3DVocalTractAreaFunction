3D Vocal Tract Area Function Extraction

This is the semi-automatic procedure for 3D vocal tract area function extraction.

Folders:
 - STL
  - Original .STL format 3D vocal tract (input of this procedure).
  - Note that all the 3D vocal tract models have to toward the same direction.
  
 - Data
  - Store the data generated in the process of area function extraction.
  
 - Figures
  - Store the figures generated in the process of area function extraction.
  
 - Cross-section
  - Store the cross-section figures of vocal tract.


Codes:
 - S1_readSTL.m
  - Read orginal .STL format 3D vocal tract.
 - S2_norSTL.m
  - ranslate the 3D vocal tract to make sure all axis values are greater than 0. 
 - S3_midSagPlane.m
  - Find out the mid-sagittal plane of vocal tract.
 - S4_glottisLine.m
  - Define and draw the line of glottis on mid-sagittal plane.
 - S5_vtRotation.m
  - Rotate the vocal tract on mid-sagittal plane along the line of glottis.
  - Note that axis have to be changed for different gender of the speakers (female:140 and male:200).
 - S6_outlineConn.m
  - Trace and connect the contour of the vocal tract on mid-sagittal plane. 
 - S7_regionGrowing.m
  - Region growing in vocal tract.
 - S8_midPointCalculation.m
  - Calculate the mid-point of each layer.
  - Note that axis have to be changed for different gender of the speakers (female:140 and male:200).
 - S9_midPointAdded.m
  - Select the mid-points and define the open-end of the lip.
 - S10_midLine.m
  - Calculate and draw mid-line in vocal tract.
 - S11_tangentLine.m
  - Calculate tanget line
  - Note that
   - Interval has to be changed. 
   - Interint has to be changed (divide the mid-line into many groups every XX mm for 
     tanget line calculation, otherwise the tanget lines will be rotated).
   - Axis have to be changed for different gender of the speakers (female:140 and male:200).
 - S12_tangentLineRotate.m
   - Rotate the vocal tract with tanget line.
 - S13_crossSectionCut.m
   - Extract cross-section of the vocal tract.
   - Run this file firstly, then modify the axis value.
   - Note that you have to modify the figures in order to remain the regions you needed.
 - S14_areaFunctionCalculation
   - Calculate area function of the vocal tract.
   - Width and length of each image have to be defined.
 
 
 
 
 
 
 
 
 