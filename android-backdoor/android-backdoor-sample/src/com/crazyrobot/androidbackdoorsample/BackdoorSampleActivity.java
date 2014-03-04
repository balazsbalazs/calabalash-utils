package com.crazyrobot.androidbackdoorsample;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.EditText;

import com.krazyrobot.backdoor.Backdoor;
import com.krazyrobot.backdoor.BackdoorAction;

public class BackdoorSampleActivity extends Activity {

	private EditText mEmailEditText;
	private EditText mPwdEditText;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_backdoor_sample);

		mEmailEditText = (EditText) findViewById(R.id.email_edittext);
		mPwdEditText = (EditText) findViewById(R.id.pwd_edittext);

		Backdoor.addDebugAction(new LoginAction());
	}

	/**
	 * Write this into a command shell:
	 * adb shell am broadcast -a com.krazyrobot.sample.login --es username balazs --es pwd qwerty
	 */
	private class LoginAction implements BackdoorAction {
		private final String TAG = LoginAction.class.getSimpleName();

		@Override
		public String getName() {
			return "login";
		}

		@Override
		public void onActionReceived(Intent intent) {
			String usernameArgument = intent.getStringExtra("username");
			String pwdArgument = intent.getStringExtra("pwd");

			Log.d(TAG, String.format("onActionReceived(%s, %s)", usernameArgument, pwdArgument));

			mEmailEditText.setText(usernameArgument);
			mPwdEditText.setText(pwdArgument);
		}

	}

}
