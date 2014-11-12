title: Chrome Devtools Rendering Settings
date: 2014-11-12 16:47:02
categories:
- 性能
tags:
- chrome
- devtools
---

请参考下图打开设置面板：

![enter image description here](http://fedev.baidu.com/~guoshuyan/render-settings/rendering-settings.png)

# Show paint rectangles

勾选此项后，你可以看到Chrome的绘制区域。这可以帮助你找到并最终避免页面上冗余的绘制过程[[1]](http://www.html5rocks.com/en/tutorials/speed/unnecessary-paints/)。同时，当有悬停链接，弹出层或动态更新内容等行为发生时，你也能通过它研究绘制行为[[2]](http://www.paulirish.com/2011/viewing-chromes-paint-cycle/)。

![enter image description here](http://fedev.baidu.com/~guoshuyan/render-settings/show-paint-rects.png)

显示绘制区域能够同时展示每一帧内所有的绘制区域，从而明晰哪些行为导致了性能降低。理想情况下，你需要尽可能保证最少的绘制区域数量。

# Show composited layer borders

该选项能高亮显示layer（Chrome使用它加快渲染时间[[3]](http://www.html5rocks.com/en/tutorials/speed/layers/)）。启动它可以帮助我们减少需渲染元素（比如动画或应用CSS变形、过渡动画使得元素形状或位置发生变化）所花费的开销。

> 蓝色方框表示一个tile（你可以认为是layer的亚单元）。Chrome通过向GPU上传部分tiles（而不是一个大的layer）以提升性能，这在大多数情况下是极其重要的。

![enter image description here](http://fedev.baidu.com/~guoshuyan/render-settings/composited-layer-borders.png)

同时应用**Show paint rectangles**和**Show composited layer borders**有助于在Timeline面板下找到非必需的绘制和relayout。

> 此两项功能仅在DevTools面板启动时可用，如需一直可用，需要在`chrome://flags`中进行设置。

# Show FPS meter

该项功能会在页面右上角覆盖一个实时更新的FPS计量表[4](http://www.youtube.com/watch?v=x6qe_kVaBpg&t=23m17s)。

![enter image description here](http://fedev.baidu.com/~guoshuyan/render-settings/fps-meter.png)

在Chrome on Android的FPS计量表上同时展示了GPU内存的使用情况。在开发有（大量）动画效果的页面时打开FPS计量表尤其有用。

# Enable continuous page repainting

这个工具帮助你辨识页面上“开销昂贵”的元素[[5]](http://www.html5rocks.com/en/mobile/profiling/) 。开启功能后页面会不断地重新绘制，同时展示此时发生的绘制数。你可以隐藏元素，调整样式，观察计数器从而弄清楚是什么导致页面变慢[[6]](http://updates.html5rocks.com/2013/02/Profiling-Long-Paint-Times-with-DevTools-Continuous-Painting-Mode)。

![enter image description here](http://fedev.baidu.com/~guoshuyan/render-settings/continuous-page-repainting.png)

# Show potential scroll bottlenecks

展现使滚动变慢的区域。对触摸和滚动事件的监听会使滚动延迟。有些区域需要在滚动时绘制其内容。更多内容可参考[[7]](https://code.google.com/p/chromium/issues/detail?id=253552#c13)

-----
> 原文链接 [Rendering Settings](https://developer.chrome.com/devtools/docs/rendering-settings)
> Content available under the [CC-By 3.0 license](http://creativecommons.org/licenses/by/3.0/)
