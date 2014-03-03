package com.krazyrobot.backdoor;

import android.content.Intent;

/**
 * <p>
 * Interface for defining a backdoor action. Every action is identified by a
 * name and has a callback where it can handle the action with parameters.
 * </p>
 * 
 * @author balazsbalazs
 * 
 */
public interface BackdoorAction {
	/**
	 * Returns with the name of the action. You have to use this name when you
	 * send your broadcast message.
	 * 
	 * @return - unique String used for identifying the action
	 */
	public String getName();

	/**
	 * This method is called when the BroadcastReceiver gets the broadcast with
	 * the name of the action. The complete intent is passed in as a parameter
	 * so you can extract the parameter extras from it.
	 * 
	 * @param intent
	 */
	public void onActionReceived(Intent intent);
}
