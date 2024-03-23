# Lab4-2

一、Block Diagram：

  。Datapath
  
  此次實驗我們先使用了c語言做功能的模擬，除了卷積功能的模擬以外還有做到BRAM的位址該如何選擇的部分，而不使用移位的方式來做值的讀取以及卷積，大致將功能描述出來後畫流程圖，如圖(一)以及圖(二)。
  
  此次實驗我們設計成全部只使用一個加法以及一個乘法，並用resource sharing的方式共用加法器的部分，而會用到加法器的有兩個部分，第一個就是卷積的部分，需要做加法，另一個是紀錄目前是第幾筆資料的暫存器，而我們使用減法的方式來更新目前筆數的資料，因此我們的加法是丟入-1也就是32’hFFFF_FFFFF的方式來做減一的操作。
  
  暫存器的部分我們使用了五組個暫存器，其中tap_addr和data_addr是使用了4bits，紀錄目前的位址，以及一個4bits的暫存器用於紀錄這次的data_addr該從哪個位址開始，剩下三個32bits的暫存器用於紀錄目前筆數、此次輸入的length值、以及用於卷積計算的累加器。
  	
  除了紀錄輸入的length值的暫存器外，都使用mux來做選擇輸入的動作，因此控制訊號就是圍繞這些mux，以及我們使用了enable來控制是否寫入此暫存器。
   
  ![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/cd405d9d-67f4-45ba-9a24-dc8ef636d9e2)
  
  圖(一)
  
  ![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/0b5acb24-cc54-446b-98b0-7b708f06b4c8)
  
  圖(二)

。	FSM
  1.	IDLE：
  在IDLE中會等待awaddr以及wdata來做功能的選擇，能夠進到RD_LEN、RD_TAP、RD_Xn，此狀態會將ap_idle拉起，讓tb知道可以進行其他操作。
  2.	RD_LEN：
  讀取length的值，保存至暫存器，完成後回到IDLE。
  3.	RD_TAP：
  讀取11個tap的值到tap BRAM，並同時將data BRAM清零，完成後進到CK_TAP。
  4.	CK_TAP：
  將讀取到tap BRAM的數值傳至tb，在經由tb做tap的核對，完成後進到IDLE等待新的指令。
  5.	RD_Xn：
  由stream-in讀取data後將data寫入至data BRAM中正確的位置，讀到資料後進到MUL_ADD，進行卷積運算。
  6.	MUL_ADD：
  開始執行11個週期的卷積運算，每個週期會讀出對應的data和tap做相乘，最後在將乘法的結果和累加器的結果相加後放入累加器暫存器中，完成後進到TRANS_Yn。
  7.	TRANS_Yn：
  將計算的結果經由stream-out送到tb端，並等到tb端回傳ready訊號後，若全部筆數已完成，則進入DONE，否則就是回到RD_Xn繼續下一個讀取、做卷積的循環，此狀態在將要進入DONE狀態時會將ap_done拉起。
  8.	DONE：
  此狀態會將data BRAM的值在次清空，這樣到IDLE時若要直接進到RD_Xn做讀data，卷積的動作時結果才會正確。

  ![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/118a0982-bc42-4c5e-8f5c-49e4420b5b49)

  圖(三)

三、	Waveform and analysis of the hardware/software behavior
由圖(四)的firmware code中可以看到，在打出0xAB60後會先確定一次FIR是否IDLE如圖(五)。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/63791b1c-5cd3-4b47-80f1-396f5c8cd90f)

圖(四)

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/5e1759dd-5548-490e-a529-87854196f452)

圖(五)
讀到FIR的狀態且為IDLE後就開始傳送length，如圖(六)波型。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/ebd9425a-613a-46bd-a498-b9263c227dcb)

圖(六)


以及傳送data的部分，如圖(七)和圖(八)波型。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/7f0ff24e-ddc2-4ca8-9880-770884a5f7d0)

圖(七)

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/10de6996-6180-4821-b02f-1cba992622da)

圖(八)

在傳送完這些東西之後會再次檢查是否回到IDLE後，打出ap_start並開始計數如圖(九)和圖(十)波型。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/687fcebd-9eac-4577-92c9-c2de1ed08857)

圖(九)

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/2ba49e01-2216-4270-a676-54ce567390ff)

圖(十)






接著會打出0xA500讓TB端開始做latency的計數，TB端為圖(十一)和其對應波型圖(十二)。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/1abe1bfc-ed95-4ceb-9075-80c450eda707)

圖(十一)

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/8870daf9-97ba-420a-9264-dfba1ca89b7b)

圖(十二)

接著進到FIR主要的功能部份，firmware的部分使用一層迴圈來完成，N=64，傳送64筆由CPU產生的data到FIR，每次會先讀取Xn是否可以傳送，直到FIR回送準備好的信號後傳送Xn。
再來會去讀取Yn是否運算完成，讀到後會收取FIR運算完的data，並將其左移24bit，此舉是為了讓data對齊mprj，使其由mprj[31:24]傳送回TB端，接著判斷是否為最後一筆資料，若為最後一筆資料則在mprj[23:16]輸出0x5A；若不是最後一筆資料則在mprj[23:16]輸出目前的計數數字，讓TB端可以將data和在TB端產生的golden data做比對並輸出結果是否正確。
最後將FIR的狀態清除並重複以上動作直到data傳送完。如圖(十三)。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/afb2c6f1-bc25-4448-84ac-08a01bb12bad)

圖(十三)

而在TB端的部分會去做latency timer的控制，以及TB會去比對資料的正確性後，將結果顯示出來，如以下四張圖。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/4b74de98-75a3-4ea4-967f-892a6eb5e8d1)

圖(十四)

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/d0e4bd34-87bd-4987-8d38-020a1cbae499)

圖(十五)

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/80130c7f-b769-41ff-92f3-3d4f81d91b24)

圖(十六)

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/636680b8-4937-4aeb-8c66-a84137b447d7)

圖(十七)

下面的部分是抽出FIR的執行過程的波型以及解釋，圖(十八)是讀取FIR是否準備收取data。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/ad3a8886-3877-4636-b5d8-6fa92aa42dac)

圖(十八)

接著是傳送data到FIR中的部分，如圖(十九)。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/b8793c0d-e346-43db-a047-06d90254e3bc)

圖(十九)

圖(二十)為收到FIR傳回Yn準備好的信號。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/d799960f-4444-4067-a189-56b7cb56b0da)

圖(二十)

然後收取FIR運算完的結果，如圖(二十一)。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/e4de102b-3ec5-40e0-879b-7b4ddde9c868)

圖(二十一)

最後一筆資料加上0x005A的結果如圖(二十二)。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/e896ee79-a43d-4a2e-9e1d-dd9693228fe3)

圖(二十二)

圖(二十三)是將FIR的狀態回復至原先狀態。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/c8e99644-b9d4-4c75-a88f-f91a5ab8fbf7)

圖(二十三)

圖(二十四)是最後的部分，firmware code的部分，會先讀取到done flag，最後到迴圈外面輸出0xAB61後結束模擬。

![image](https://github.com/Fossum2523/Lab4-2/assets/131112486/12287f2b-570e-48b8-aef2-494b6f590ae6)

圖(二十四)

二、The interface protocol between firmware, user project and testbench

Firmware和user project和Testbench之間的溝通是透過Wishbone bus，以及透過Wishbone bus to AXI的部分轉換成FIR看的懂的AXI interface。在FIR計算開始前firmware會打出0x00A5到mprj的第23到第16隻讓latency timer開始計數，並根據Configuration Register Address map傳送適當的資料到FIR，而FIR的輸出結果會被我們的firmware端存起來，而我們的firmware端會把FIR的資料結果放到mprj的第31到第24隻，而mprj的第23到第16隻firmware會傳出目前是第幾筆資料被送出，且在最後一筆資料時會送出0x5A。藉由此操作就能夠讓TB端能夠核對送回來的答案。
