WWDC-2013-Scholarship-App
=========================

The app is called 'SlideMyLife'. I submitted it as my app for the WWDC 2013 scholarship. Basically you keep sliding to see snippets of information about me, its like a storyboard! KNOWN ISSUE: The app may receive a memory warning and even potentially crash, this is because the 'slides' array is holding 25 active UIView objects at its most memory consuming time. I only found this problem early morning, 2 hours before WWDC scholarships were due. I didn't have time to fix it. If you want to, what you basically need to do is filter the array to only keep a maximum of three slides at a time (previous slide, current slide, next slide)
