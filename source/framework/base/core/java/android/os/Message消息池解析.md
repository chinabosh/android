#消息队列
  Message中用静态链表方式维护一个消息队列  
  `private static Message sPool;`  
  在没有使用的时候，sPool为空。可以通过Message.obtain()来获取消息池
  中的Message。  
````
  public static Message obtain() {
          synchronized (sPoolSync) {
              if (sPool != null) {
                  Message m = sPool;
                  sPool = m.next;
                  m.next = null;
                  m.flags = 0; // clear in-use flag
                  sPoolSize--;
                  return m;
              }
          }
          return new Message();
      }  
````
  可以看到，如果队列空了，就new一个新的Message返回，否则就取链表头部
  数据返回。  
  那么一开始链表的数据哪里来呢？  
  答案是Message用完recycler后添加到队列中
````
  public void recycle() {
          if (isInUse()) {
              if (gCheckRecycle) {
                  throw new IllegalStateException("This message cannot be recycled because it "
                          + "is still in use.");
              }
              return;
          }
          recycleUnchecked();
      }
      
      void recycleUnchecked() {
              // Mark the message as in use while it remains in the recycled object pool.
              // Clear out all other details.
              flags = FLAG_IN_USE;
              what = 0;
              arg1 = 0;
              arg2 = 0;
              obj = null;
              replyTo = null;
              sendingUid = -1;
              when = 0;
              target = null;
              callback = null;
              data = null;
      
              synchronized (sPoolSync) {
                  if (sPoolSize < MAX_POOL_SIZE) {
                      next = sPool;
                      sPool = this;
                      sPoolSize++;
                  }
              }
          }
````  
  recycle方法主要判断一下message是不是还在使用，如果还在使用就抛出异常
  ，否则调用recycleUnchecked将变量置空，并且当链表中的message数量没达
  到最大值时将message插入链表头部。
 
  
