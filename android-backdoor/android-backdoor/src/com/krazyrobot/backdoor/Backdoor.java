package com.krazyrobot.backdoor;

import java.util.HashMap;
import java.util.Map;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.util.Log;

/**
 * A class which acts as a backdoor to your application.
 * 
 * You can send broadcasts to your application either via command line or from
 * another (debug) app for performing some backdoor operations.
 * 
 * Note: As a best practice only use this class in your debug builds.
 * 
 * @author balazsbalazs
 * 
 */
public class Backdoor {
	private final static String TAG = Backdoor.class.getSimpleName();

	private static Context sContext;
	private static String sPrefix;

	private static Map<String, BackdoorAction> mDebugActions = new HashMap<String, BackdoorAction>();

	public static void init(Context context) {
		init(context, "");
	}
	
	/**
	 * Initialize your DeubgInterfac with a prefix. To avoid namespace collision
	 * all the actions will use the given prefix
	 * 
	 * @param context
	 * @param prefix
	 */
	public static void init(Context context, String prefix) {
		sContext = context;
		sPrefix = prefix;
	}

	/**
	 * Register a BroadcastReceiver for a {@link BackdoorAction}.
	 * 
	 * @param action
	 */
	public static void addDebugAction(BackdoorAction action) {
		String fullAcitionName = sPrefix + "." + action.getName();
		mDebugActions.put(fullAcitionName, action);
		Log.d(TAG, String.format("Add debug action: %s", fullAcitionName));
		registerDebugActions();
	}

	public static void removeDebugAction(String actionName) {
		String completeAction = sPrefix + "." + actionName;
		mDebugActions.remove(completeAction);
		registerDebugActions();
	}

	private static void registerDebugActions() {
		IntentFilter filter = new IntentFilter();
		for (String currentAction : mDebugActions.keySet()) {
			filter.addAction(currentAction);
		}
		sContext.registerReceiver(mReceiver, filter);
	}

	private static BroadcastReceiver mReceiver = new BroadcastReceiver() {
		@Override
		public void onReceive(Context context, Intent intent) {
			String actionName = intent.getAction();
			Log.d(TAG, "Debug action recieved: " + actionName);
			BackdoorAction action = mDebugActions.get(actionName);
			if (action != null) {
				action.onActionReceived(intent);
			}
		}
	};

}
