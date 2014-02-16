calabalash-utils
================

<br>
Essential utilities for [calabash-android].

<br>
Calabalash-utils is a collection of utility methods for calabash-android. It has support for the following things:

  - find and touch an element in a list (even if the element is not on screen) [(demo)][article-1]
  - scroll to the top or bottom of a list




Version
-

1.0
</br>

Samples
-----------
The samples are using the Android API Demos app to show you how the library works.


In the <code>sample</code> directory there is a calabash project set up - you only need to run it.

There is a feature file ([<code>demo.feature</code>][internal-1]) and the connected step definition file ([<code>demo_steps.rb</code>][internal-2])
</br>


Blog
-----------

For more tips and tricks, real-life examples and best practices visit my [blog] [1].

> "Quality is not an act. It is a habit." 
</br>


Installation & running the samples
--------------

```sh
git clone https://github.com/balazsbalazs/calabalash-utils.git calabalash-utils
cd calabalash-utils/sample
./run.sh
```


License
-

MIT

*Free Software, Fuck Yeah!*

  [calabash-android]: https://github.com/calabash/calabash-android
  [1]: http://dontbelievenintdd.wordpress.com/
  [article-1]: http://dontbelievenintdd.wordpress.com/2014/01/24/calabash-tips-scroll-a-list-until-you-find-a-specific-element-on-android/
  [internal-1]: https://github.com/balazsbalazs/calabalash-utils/blob/master/sample/features/demo.feature
  [internal-2]: https://github.com/balazsbalazs/calabalash-utils/blob/master/sample/features/step_definitions/demo_steps.rb
