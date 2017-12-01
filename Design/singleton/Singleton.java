public class Singleton {  
    private volatile static Singleton singleton;
    
    private Singleton (){}  //构造方法私有，确保其他地方无法创建实例
    
    public static Singleton getSingleton() {  
    if (singleton == null) {  
        synchronized (Singleton.class) {  
        if (singleton == null) {  
            singleton = new Singleton();  
        }  
        }  
    }  
    return singleton;  
    }  
} 
