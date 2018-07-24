#NSProxy的使用

需要使用中间对象来调用方法，可以使用NSProxy来实现
用途通过协议类解决循环引用的问题——如定时器

timer——>controller(强引用)  
controller——>timer(强引用)  

--
timer——>proxy(强引用)  
proxy——>controller(弱引用)  
controller——>timer(强引用) 
 
--

--
设计第三方协议类proxy弱引用

方案1：继承自NSObject类（MYProxy）  
方案2：继承自NSProxy类（RYProxy）  

--

方案2比方案1效率高：NSObject的子类进行消息转发需要经过消息发送阶段，会通过方法缓存cache和方法列表，动态解析，然后才会到消息转发；NSProxy没有消息发送的过程，直接会进入消息转发机制中的methodSignatureForSelector:方法
