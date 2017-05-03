# Dynamics
UIKit Dynamics illustrator in swift 3

![Dynamics Screenshot](/DynamicsScreenShot.png)

Dynamics is a swift3 code that illustrates UIKit Dynamics (UIDynamicAnimator). You are able to apply physical behaviors such as Gravity and Collision to your UIViews with a relatively not much code.
In this app you find assorted shapes in color and size : some are rects, circles and a triangle. All are UIViews.
Pressing on button `Fall` will embark gravitational movement of the shapes subject to the values you
set on sliders for elasticity, friction and resistance. What are those? see following explanations:

(By the way , button `Lift` is to reset the shapes and replace them to in initial position so you can drop them again)

Elasticity Slider
-----------------
The amount of elasticity applied to collisions for the behavior’s dynamic items. Range is from 0.0 for no bounce upon collision, to 1.0 for completely elastic collisions.

Friction Slider
-----------------
The linear resistance for the behavior’s dynamic items when two slide against each other. Range is from
0.0, which corresponds to no friction. Use a value of 1.0 to apply strong friction. To apply an even stronger friction, you can use higher numbers.
I've set it up to 3.0 (change if you like)

Resistance Slider
-----------------
The linear resistance for the behavior’s dynamic items, which reduces their linear velocity over time. Default value is 0.0. Valid range is from 0.0 for no velocity damping, to CGFLOAT_MAX for complete velocity damping. If you set this property to 1.0, a dynamic item’s motion stops as soon as there is no force applied to it.
I've set up to 5.0 (you may alter this of course and check results)

Free License.
