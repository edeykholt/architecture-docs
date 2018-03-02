��    +      t  ;   �      �     �     �     �     �  3   	     =  !   T  $   v  0   �  ,   �  �   �  .   �       �   +  	     P       a     y  (   }  V   �     �     	  
   	     )	     1	     F	     J	  �   O	     
     
  	   %
  	  /
  ;  9  ;  u    �  ^   �       @  "  �   c  }  /  g   �  �     T  �       	   #     -     4  -   D     r     �     �  8   �  #   �      '        @  �   M  	   �  K   �  �   F      B!  %   I!  X   o!     �!     �!     �!     �!     �!     "     "  �   "     �"     �"     �"  �  �"  �  �$  <  �&  (  �'  W   �*  �  V+  4  �,  �   ./    �/  T   �1  �   I2                                          	                !       *       &                 )                  #                   $   
                       +      (      %   '                 "             **Consumer Verb** **Continuation(K)** [#]_ **Data** **Database read and write** **Item-level read and write (distributed locking)** **Producer Verb** [#]_ **Publish / Subscribe messaging** **Publish / Subscribe with history** *Figure - Decentralized Data Access in SpecialK* *Figure - SpecialK’s Data Access Patterns* A variety of data is supported, including public unencrypted json, encrypted BLOBs, or a mix. This data can also be simple pointers or content-hashes referencing off-platform data stored in private, public, or consortium locations and formats. Data Access Layer and Domain Specific Language Data Semantics Data will be accessed using the SpecialK semantics, while physically being stored in a  decentralized, Key-Value Database known as "KVDB". A view of how two nodes collaborate to respond to a get request is shown below: Ephemeral For more information, see `SpecialK & KVDB`_ – A Pattern Language for the Web. From the point of view of the SpecialK DSL and API, when it performs a data-access action, such as the verb Get (with a pattern), it is indifferent to whether that data it is stored locally or remotely i.e on some other network node. There is a single query mechanism regardless. Get KVDB - Data & Continuation Access, Cache Note that by convention a continuation function is represented as a parameter named k. Overview P2P Node Communications Persistent Publish Publish with History Put Read SpecialK is the DSL for data access, while KVDB is a distributed-memory data structure behind the DSL. SpecialK defines distributed data-access patterns in a consistent way, as shown below: Storage and Query Store Subscribe The 2016 and prior SpecialK technology stack (Agent Services, SpecialK, and KVDB, with RabbitMQ and MongoDB) delivered a decentralized Content Delivery Network, although it was neither metered nor monetized. The SpecialK & KVDB components sit on top of MongoDB and an Advanced Message Queuing Protocol (ZeroMQ is being explored) to create the decentralized logic for storing and retrieving content, both locally and remotely. The current 1.0 implementations of SpecialK and KVDB are written in Scala and are in `GitHub`_. The RChain blockchain will store the state, local transaction history, and the associated continuations of a contract. Like Ethereum, the RChain blockchain will also implement crypto-economically verifiable transactional semantics to create a linear temporal history of computation performed on the platform. Note that the math underlying this blockchain semantic structure is known as a Traced Monoidal Category. For more detail see Masahito Hasegawa's paper on this topic, `Recursion from Cyclic Sharing:Traced Monoidal Categories and Models of Cyclic Lambda Calculi`_. The SpecialK decentralized storage semantics necessitate a node communications infrastructure. Similar to other decentralized implementations, the P2P communications component handles node discovery, inter-node trust, and communication. The current implementation uses RabbitMQ, although ZeroMQ is being considered. The Storage and Query network layer *appears* to each node as a local, asynchronously accessed database with rented storage. Behind the scenes, however, the Storage and Query layer is fully decentralized and subject to the consensus algorithm. In accordance with the micro-transaction capabilities inherent to blockchain solutions, dApp users on RChain pay for resources (compute, memory, storage, and network) using tokens. The RChain design considers all storage “conserved”, although not all data will be conserved forever. Instead, data storage will be rented and will cost producers of that data in proportion to its size, complexity, and lease duration. Consumers may also be required to pay for retrieval access. Data producers and consumers indirectly pay node operators. The node first queries its in-memory cache for the requested data. Then if it is not found it, The query semantics vary depending on which level in the architecture is involved. At the SpecialK level, keys are prolog expressions, which are later queried via datalog expressions. Higher up in the architecture, prolog expressions of labels are used for storage, and datalog expressions of labels are used for query. In RChain, the SpecialK and KVDB layers will be reimplemented in Rholang (versus the prior implementation in Scala with custom implementation of delimited continuations and code serialization). The simple economic reason justifying leasing is that storage must be paid by someone; otherwise it cannot be stored reliably or “forever”. We’ve chosen to make the economic mechanism direct. It is an environmentally unfriendly idea that storage is made "free" only to subsidize it by an unrelated process. A small part of the real cost is measurable in the heat signatures of the data centers that are growing to staggering size. This charging for data as it is accessed also helps reduce "attack" storage i.e the storage of illegal content to discredit the technology. This is only a subset of the verbs possible under this decomposition of the functionality. The verb fetch, for example, gets the data without leaving a continuation around, if there is no data available. Why did RChain not select IPFS (InterPlanetary File System) for distributed memory? In addition to carrying centralization risks, IPFS uses a path to get to content, whereas SpecialK uses entire trees (and trees with holes in them) to get to content. IPFS has an intuitive path model, but that design begs the question on how to do queries. SpecialK started from the query side of addressing. Now, the RChain project can benefit from the IPFS work, including their hashing for addressing content, once the SpecialK query semantics are in place. SpecialK can also utilize a randomly generated flat key that has no correlation to the data. queries its local store, and, if it is not found, stores a delimited continuation at that location, and queries the network. If and when the network returns the appropriate data, the delimited continuation is brought back in scope with the retrieved data as its parameter. Project-Id-Version: RChain Architecture 0.9
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-01-18 16:26+0800
PO-Revision-Date: 2018-01-24 20:54+0800
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
Last-Translator: 
Language-Team: 
X-Generator: Poedit 2.0.5
Language: zh_CN
 消费者动词 延续(K) 数据 数据库读写 数据项级别的读写（分布式锁定） 生产者动词 消息发布与订阅 历史信息发布与订阅 使用SpecialK进行去中心化数据访问的示意图 SpecialK式的数据访问模式图 RChain支持多种格式的数据，包括公开未加密的json格式的数据，加密的大文件或者混合的数据格式。这些数据可以是一些指向区块链外私有、公开或者联盟式存储的文件的指针或者内容哈希的简单数据 数据访问层以及领域专属语言 数据语义 数据将使用SpecialK语义进行访问，存储在去中心化的键值数据库（KVDB）中。下图显示了两个节点如何协作响应一个GET请求。 暂时的 有关更多信息，请参阅SpecialK＆KVDB - 一种Web的模式语言。 从SpecialK领域专属语言和API的角度来看，当它执行一个数据访问动作，比如Get（带有一个请求模式）请求时，对于这个数据是存储在本地还是在远程是不做区分的。这里有一个单独的查询机制 获取 KVDB - 数据，延续访问和缓存 请注意，按照惯例，一个连续函数会被当作一个参数名为k的参数。 总览 P2P节点通信 持久化的 发布 携带历史发布 放置 读取 SpecialK是用于数据访问的领域专属语言，而KVDB是DSL背后的分布式内存数据结构。SpecialK以一致的方式定义分布式数据访问模式，如下所示： 存储与查询 存储 订阅 在2016年之前，SpecialK的技术栈（包括代理服务，SpecialK，KV数据库，RabbitMQ以及MongoDB）提供了一个分散的内容交付网络，尽管其中不包含资源计量或者资源货币化的内容。SpecialK和KVDB组件基于底层数据库MongoDB以及一个高级的消息队列协议（ZeroMQ）搭建，以创建用于本地和远程存储和检索内容的去中心化逻辑。目前SpecialK和KVDB的1.0实现都是用Scala编写的 状态数据、本地交易记录以及相关的合约数据将会被存储在RChain区块链上。与以太坊类似，RChain也将实现密码经济可验证的交易以便于记录在区块链上进行运算的信息。请注意，区块链语义结构下的数学被称作可追溯的范畴论。如果想了解更多的细节，请参阅Masahito Hasegawa发表的该主题的论文Recursion from Cyclic Sharing:Traced Monoidal Categories and Models of Cyclic Lambda Calculi SpecialK去中心化存储语义需要节点通信的基础设施。与其他去中心化应用相似，在RChain中P2P通信组件还是处理节点发现，节点间信任以及节点间通信等问题。现在的实现方案采用了基于RabbitMQ的P2P架构，尽管我们同时也在考虑是否采用ZeroMQ。 对存储层与网络查询层来说，每个节点都被视为一个本地节点，都是通过异步的方式访问在区块链上租借存储区域来实现访问数据库的目的。不过实际上，存储与查询是完全分离的，但是两者的数据是完全一致的。根据区块链固有的微观交易能力，RChain上的dApp用户使用代币来支付他们使用的区块链资源（计算，内存，存储和网络）。在RChain的设计中，所有的数据会被存储，只不过并不是所有的数据都是永远存储的。RChain的数据存储区域是可以租借的，存储资源的价格由数据的大小，复杂度，存储时长决定。数据的消费者每次访问数据都需要付费。数据的生产者以及消费者间接地向RChain节点的运营者付费。 节点首先在内存缓存中查找所请求的数据。如果没有在缓存中命中 查询语义根据体系结构中相关的级别而有所不同。在SpecialK级别，键值是prolog表达式，该表达式可以通过datalog表达式进行查询。在架构级别，标签的prolog表达式用于存储，标签的datalog表达式用于查询。在RChain中，SpecialK和KVDB层将用Rholang重新实现（与先前在Scala中的定制实现有界连续和代码序列化的实现有所不同）。 从经济学的角度来看，租赁存储空间时用户必须进行付费是合理的。没有经济的驱动，数据很难能够被可靠地或者永久的存储。我们选择直接定制经济规则。假设存储是免费的而仅仅通过一些其他的流程来补贴存储的开销，那么这对于环境来说其实是不友好的。真实成本的其中一小部分可以在数据中心的热量特征中测量出来。对数据访问需要付费的机制也有利于减少针对于存储的攻击，即存储非法的内容来诋毁区块链技术。 这只是这个功能分解下动作的一个子集。例如fetch动作，在没有数据的情况下，在数据检索过程中不会留下任何有界连续信息。 为什么RChain没有选择分布式存储的IPFS（星际文件系统）？除了存在集中化风险之外，IPFS使用内容路径来访问内容，而SpecialK使用整颗树（和其中有孔的树）来访问内容。IPFS有一个直观的路径模型，但是这个设计存在如何进行查询的问题。 SpecialK从寻址开始。现在一旦SpecialK查询语义设计完成，RChain项目可以借鉴IPFS的成果，例如利用哈希来完成内容的路由。SpecialK还可以利用一个随机生成的键，与数据无关。 在本地存储中进行查询，如果没有命中，在该位置存储有界连续 在网络中进行查询，如果在网络中查找到了合适的值，将有界连续带回范围并且将检索到的数据作为参数返回 