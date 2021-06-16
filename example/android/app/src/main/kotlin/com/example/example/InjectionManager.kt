//package com.puppy.rcserver
//
//import android.content.Context
//import android.hardware.input.InputManager
//import android.os.Build
//import android.os.SystemClock
//import android.util.Log
//import android.view.*
//import androidx.annotation.RequiresApi
//import kotlinx.coroutines.Dispatchers
//import kotlinx.coroutines.GlobalScope
//import kotlinx.coroutines.delay
//import kotlinx.coroutines.launch
//import java.lang.reflect.InvocationTargetException
//import java.lang.reflect.Method
//
///**
// * created by yujianbin on 2019/2/18
// *
// */
//@RequiresApi(Build.VERSION_CODES.JELLY_BEAN)
//class InjectionManager(ctx: Context) {
//
//
//    companion object {
//        private val TAG = InjectionManager::class.java.simpleName
//        private var INJECT_INPUT_EVENT_MODE_ASYNC = 0
//        private var INJECT_INPUT_EVENT_MODE_WAIT_FOR_RESULT = 0
//        private var INJECT_INPUT_EVENT_MODE_WAIT_FOR_FINISH = 0
//        private val INTERNAL_SERVICE_PRE_JELLY = "window"
//    }
//
//    private var mInputManager: InputManager? = null
//    private var mInjectEventMethod: Method? = null
//
//
//    init {
//        try {
//
//            if (Integer.valueOf(Build.VERSION.SDK_INT) < Build.VERSION_CODES.JELLY_BEAN){
//                run {
//
//                }
//            }else{
//                mInputManager = ctx.getSystemService(Context.INPUT_SERVICE) as InputManager
//                mInjectEventMethod = mInputManager!!::class.java.getDeclaredMethod("injectInputEvent",
//                        InputEvent::class.java, Integer.TYPE)
//                mInjectEventMethod!!.isAccessible = true
//
//                val eventAsync = mInputManager!!::class.java.getDeclaredField("INJECT_INPUT_EVENT_MODE_ASYNC")
//                val eventResult = mInputManager!!::class.java.getDeclaredField("INJECT_INPUT_EVENT_MODE_WAIT_FOR_RESULT")
//                val eventFinish = mInputManager!!::class.java.getDeclaredField("INJECT_INPUT_EVENT_MODE_WAIT_FOR_FINISH")
//                eventAsync.isAccessible = true
//                eventResult.isAccessible = true
//                eventFinish.isAccessible = true
//
//                INJECT_INPUT_EVENT_MODE_ASYNC = eventAsync.getInt(mInputManager!!::class.java)
//                INJECT_INPUT_EVENT_MODE_WAIT_FOR_RESULT = eventResult.getInt(mInputManager!!::class.java)
//                INJECT_INPUT_EVENT_MODE_WAIT_FOR_FINISH = eventResult.getInt(mInputManager!!::class.java)
//
//            }
//
//        }catch (nsme:NoSuchMethodException ){
//            Log.e(TAG, "Critical methods not available")
//        }catch (nsfe:NoSuchFieldException){
//            Log.e(TAG, "Critical fields not available")
//        }catch (iae:IllegalAccessException){
//            Log.e(TAG, "Critical fields not accessable")
//        }
//    }
//
//    private fun injectEvent(ie:InputEvent, mode: Int){
//
//        try {
//
//            if (Integer.valueOf(Build.VERSION.SDK_INT) < Build.VERSION_CODES.JELLY_BEAN) {
//
//            } else {
//                mInjectEventMethod!!.invoke(mInputManager, ie, mode)
//            }
//
//        }catch (iae:IllegalAccessException){
//            Log.e(TAG, "Critical methods not accessable: " + iae.localizedMessage)
//
//        }catch (ite: InvocationTargetException){
//            ite.targetException.printStackTrace()
//        }catch (se:SecurityException){
//            Log.e(TAG, "Error using injection method: " + se.localizedMessage)
//        }catch (e: Exception){
//            Log.e(TAG, "Error using injection method: " + e.localizedMessage)
//        }
//    }
//
//    private fun injectKeyEvent(ke: KeyEvent) {
//
//        // ke.setSource(InputDevice.SOURCE_ANY);
//
//        injectEvent(ke, INJECT_INPUT_EVENT_MODE_ASYNC)
//    }
//
//
//    fun injectKeyEventWithCode(keyCode: Int) {
//
//        var kc = keyCode
//        val mDownTime = SystemClock.uptimeMillis()
//        val repeatCount = if (KeyEvent.FLAG_FROM_SYSTEM and  KeyEvent.FLAG_LONG_PRESS != 0) 1 else 0
//
//        if (kc > 10000){
//            //表示长按
//            kc = keyCode - 10000
//            val down = KeyEvent(mDownTime, mDownTime, KeyEvent.ACTION_DOWN, kc,
//                    repeatCount, 0, KeyCharacterMap.VIRTUAL_KEYBOARD, 0, KeyEvent.FLAG_FROM_SYSTEM
//                    or KeyEvent.FLAG_FROM_SYSTEM
//                    or KeyEvent.FLAG_VIRTUAL_HARD_KEY,
//                    InputDevice.SOURCE_KEYBOARD)
//            injectKeyEvent(down)
//
//            //隔500毫秒注入up
//            GlobalScope.launch(Dispatchers.Main) {
//                delay(550)
//                val mUpTime = SystemClock.uptimeMillis()
//                val up = KeyEvent(mUpTime, mUpTime, KeyEvent.ACTION_UP, kc,
//                        repeatCount, 0, KeyCharacterMap.VIRTUAL_KEYBOARD, 0, KeyEvent.FLAG_FROM_SYSTEM
//                        or KeyEvent.FLAG_FROM_SYSTEM
//                        or KeyEvent.FLAG_VIRTUAL_HARD_KEY,
//                        InputDevice.SOURCE_KEYBOARD)
//                injectKeyEvent(up)
//            }
//
//        }else{
//            val down = KeyEvent(mDownTime, mDownTime, KeyEvent.ACTION_DOWN, kc,
//                    repeatCount, 0, KeyCharacterMap.VIRTUAL_KEYBOARD, 0, KeyEvent.FLAG_FROM_SYSTEM
//                    or KeyEvent.FLAG_FROM_SYSTEM
//                    or KeyEvent.FLAG_VIRTUAL_HARD_KEY,
//                    InputDevice.SOURCE_KEYBOARD)
//            injectKeyEvent(down)
//
//            val mUpTime = SystemClock.uptimeMillis()
//            val up = KeyEvent(mUpTime, mUpTime, KeyEvent.ACTION_UP, kc,
//                    repeatCount, 0, KeyCharacterMap.VIRTUAL_KEYBOARD, 0, KeyEvent.FLAG_FROM_SYSTEM
//                    or KeyEvent.FLAG_FROM_SYSTEM
//                    or KeyEvent.FLAG_VIRTUAL_HARD_KEY,
//                    InputDevice.SOURCE_KEYBOARD)
//            injectKeyEvent(up)
//
//        }
//    }
//
//
//    fun injectTouchEventDown(x: Int, y: Int) {
//        val me = MotionEvent.obtain(
//                SystemClock.uptimeMillis(),
//                SystemClock.uptimeMillis() + 10,
//                MotionEvent.ACTION_DOWN,
//                x.toFloat(),
//                y.toFloat(),
//                0
//        )
//
//        if (Integer.valueOf(Build.VERSION.SDK_INT) < Build.VERSION_CODES.JELLY_BEAN)
//        else
//            me.source = InputDevice.SOURCE_TOUCHSCREEN
//
//        injectEvent(me, INJECT_INPUT_EVENT_MODE_ASYNC)
//        me.recycle()
//    }
//
//    fun injectTouchEventRelease(x: Int, y: Int) {
//        val me = MotionEvent.obtain(
//                SystemClock.uptimeMillis(),
//                SystemClock.uptimeMillis() + 10,
//                MotionEvent.ACTION_UP,
//                x.toFloat(),
//                y.toFloat(),
//                0)
//
//        if (Integer.valueOf(Build.VERSION.SDK_INT) < Build.VERSION_CODES.JELLY_BEAN)
//        else
//            me.source = InputDevice.SOURCE_TOUCHSCREEN
//
//        injectEvent(me, INJECT_INPUT_EVENT_MODE_WAIT_FOR_RESULT)
//        me.recycle()
//    }
//
//    fun injectMotionEvent(me: MotionEvent) {
//        if (Integer.valueOf(Build.VERSION.SDK_INT) < Build.VERSION_CODES.JELLY_BEAN) {
//
//        } else {
//            me.source = InputDevice.SOURCE_TOUCHSCREEN
//        }
//        //		Log.i(TAG, "injectMotionEvent: " + me);
//        injectEvent(me, INJECT_INPUT_EVENT_MODE_ASYNC)
//        //		injectEvent(me, INJECT_INPUT_EVENT_MODE_WAIT_FOR_RESULT);
//    }
//
//    private fun printDeclaredMethods(c: Class<*>) {
//        val methods = c.declaredMethods
//        for (m in methods) {
//            Log.d(TAG, "InputManager method: " + m.name)
//        }
//    }
//
//}