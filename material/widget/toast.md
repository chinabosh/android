 # Toast
 -----
> Toast 只能通过Toast.makeText(context,msg,duration)方法来创建，不能用new Toast(context);
如果用new Toast(context),会报错：java.lang.RuntimeException: This Toast was not created with Toast.makeText()
