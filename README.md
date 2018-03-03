# IBDesignable_Example
#
#


This is a quick example on IBDesignable failing when the app uses any items that are not available in the simulator.

In this app, the storyboard has a single UIButton, subclassed as FancyRecordButton.  This class adds two @IBInspectable attributes, fancyColor1 and fancyColor2 and uses these to draw a custom background on the button.

As-is, you can change these attributes within Interface Builder, and the changes are immediately reflected on the storyboard, as expected.

HOWEVER:

If you add any classes that are not available on the simulator, the Interface Builder build fails and these attributes do not produce the expected live updates in Interface Builder.

Example, go to the AppDelegate.swift file, row 16, and uncomment this line:

	//var  layer = CAMetalLayer()

The build still functions normally on device, but now the designables says "Build Failed":

BUG #1:	The "show" button only shows regular build warnings, which are not relevant to this failure.  This show button should link to the Report Navigator.

BUG #2:	This additional line of code is in an unrelated file and should not prevent Interface Builder from properly showing the live preview of the custom button.


