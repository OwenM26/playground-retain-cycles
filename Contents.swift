import UIKit

/*
 
 This is a whistle stop tour of ARC - Swifts memory management system.
 
 ARC is the Automatic Reference Counter, when an object such as the Car
 below is assigned wheels ARC bumps the reference counter on Car up to
 1 meaning it has one reference.
 
 The idea of ARC is that when an object has 0 references ARC will automatically
 deinitialise the object for us so the memory can be allocated to something else.
 
 An object holding a reference to another object is known as a retain cycle.
 
*/

// Classes - Remember classes are reference types.

class Car {
    var wheels: Wheels?
    
    deinit {
        print("Car de-initialised")
    }
}

class Wheels {
    var numberOfWheels = 4
    
    weak var car: Car?
    
    deinit {
        print("Wheels de-initialised")
    }
}

/*
 
 Note that all var references are `Strong`.

 Notice that on the Wheels class the var car has the keyword `weak` infront, this means the reference
 between the Wheels and the Car will not be retained or `Strong` instead by using weak it means ARC
 can do it's work an deinitialise Car when the Wheels or Car is set to `nil`. By setting Wheels or
 Car to nil will reduce the reference count back down to 0 so both objects can be removed from memory.
 
*/

var car: Car? = Car()
var wheels: Wheels? = Wheels()

car?.wheels = wheels
wheels?.car = car

print(car?.wheels?.numberOfWheels ?? 0)

car = nil
wheels = nil

/*
 
 On the Wheels class remove the keyword `weak` to see how the output changes in the console.
 
 You should notice that the deinit print statements aren't printed and that's because the
 reference between the Car and the Wheels is `Strong` so ARC can't reduce the count down by 1.
 
*/
