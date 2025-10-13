# 找到一个实现从电子书pdf直接截图转为自定义的md来做笔记的工具

来源回答：https://linux.do/t/topic/999019/11

首先感谢一下这个回答下的所有佬友对我的帮助，最后感谢一下佬友@Tuh 提供的STranslate（https://stranslate.zggsong.com/）配置gemini ocr的方案，解决了我的需求。

通过在文本识别中配置相应的gemini api解决（可以去ai studio白嫖）（注意似乎是要用相对小的模型比如lite。试了一下2.5pro和flash都显示超时）
![image-20250930161112166](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509301611279.png)

最后的实操如下，可以直接截图，就可以直接复制得到的ocr内容。

![image-20250930161613273](https://sleepy-dog-1376908035.cos.ap-guangzhou.myqcloud.com/202509301616649.png)

这里如果对转md的提示词感兴趣的话可以看一下我自己写的（https://github.com/sleepyy-dog/Survival-Handbook-by-KOKO/blob/main/%E8%AF%BE%E7%A8%8B/%E5%9B%BE%E7%89%87%E8%BD%ACmd%E6%8F%90%E7%A4%BA%E8%AF%8D.md），还挺好用感觉。