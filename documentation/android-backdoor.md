android-backdoor
================

android-backdoor provides a way to access backdoor code from the command line. The idea is that you can send debug commands from your command line withouth having to touch anything in your app.

<br>
This can be useful when you want to make your test automation faster, want to make your own or qa's life easier or when you have to change something which is not exposed in UI.
</br>

Examples:
  - create a login/signup method which logs you in automatically without having to go throuh the login screens
  - change environment (stage/dev/live)
  - disable A/B tests or choose a specific A/B test

A blog post about the android-backdoor can be found [here][article-2].

Usage
-----------
#### Add library
Copy the [androidbackdoor.jar] to your Android project's `libs` directory.
#### Initialize Backdoor in your Application class
```java
public class MyApplication extends Application {
    @Override
    public void onCreate() {
        Backdoor.init(this, "com.krazyrobot.sample");
    }
}
```

#### Create custom action
Implement a custom action extending the `BackdoorAction` interface. Here you can perform your backdoor logic, access anything in your application.

```java
public class LoginAction implements BackdoorAction {
    	@Override
		public String getName() {
			return "login";
		}

		@Override
		public void onActionReceived(Intent intent) {
            // TODO: implement backdoor code
        }
}
```

#### Add your action to Backdoor
```java
Backdoor.addDebugAction(new LoginAction());
```

#### Call your action from command line
```bash
adb shell am broadcast -a com.krazyrobot.sample.login
```

Passing parameters
-----------
You can pass any number of string, int or boolean parametrs.
#### Passing parameters from command line
You can pass parameters with using the `--es` (string), `--ei` (integer) or `--ez`
(boolean) flags.
Usage: `--es [param_name] [param_value]`

Example:
```
adb shell am broadcast -a com.krazyrobot.sample.login --es username balazs --ei number 3 --ez should_login true

```
#### Parsing parameters from action
The parameters will be passed as Intent extrast. You can extract them with `getStringExtra`, `getIntExtra` or `getBooleanExtra` methods.

Example:
```Java
public void onActionReceived(Intent intent) {
    String usernameArgument = intent.getStringExtra("username");
    int numberArgument = intent.getIntExtra("number", -1);
    boolean shouldLoginArgument = intent.getBooleanExtra("should_login", false);
    ...
```

Calling backdoor from Calabash
-----------
Import [calabalash-utils.rb] into one of your step-definition files.
```ruby
require  'calabalash-utils'
```

Call an action without parameters:
```ruby
send_broadcast('login')
```

For setting arguments you can call the `int_param`, `bool_param`, `string_param` helper methods:
```ruby
send_broadcast('com.krazyrobot.sample.login', string_param('username', 'balazs'), int_param('number', 3), bool_param('should_login', true))
```

Sample code
----------------
Check out the code and go into the sample directory `sample`.
Run the sample:
```
calabash-android run AndroidBackdoorSample.apk features/backdoor.feature
```

Look at the sample code:
  * calabash sample: [backdoor.feature], [backdoor_steps.rb]
  * [Android sample]

[androidbackdoor.jar]: https://github.com/balazsbalazs/calabalash-utils/releases/download/android-backdoor-1.0/androidbackdoor.jar

[calabalash-utils.rb]: https://github.com/balazsbalazs/calabalash-utils/blob/master/calabalash-utils.rb

[backdoor.feature]: https://github.com/balazsbalazs/calabalash-utils/blob/master/sample/features/backdoor.feature

[backdoor_steps.rb]: https://github.com/balazsbalazs/calabalash-utils/blob/master/sample/features/step_definitions/backdoor_steps.rb

[Android sample]: https://github.com/balazsbalazs/calabalash-utils/blob/master/android-backdoor/android-backdoor-sample

[article-2]: http://krazyrobot.com/2014/03/calabash-android-backdoor