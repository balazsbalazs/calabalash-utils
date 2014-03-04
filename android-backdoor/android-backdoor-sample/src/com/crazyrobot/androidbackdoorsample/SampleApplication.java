package com.crazyrobot.androidbackdoorsample;

import android.app.Application;

import com.krazyrobot.backdoor.Backdoor;

public class SampleApplication extends Application {
	private Backdoor mBackdoor;

	public void onCreate() {
		Backdoor.init(this, "com.krazyrobot.sample");
	};

}
