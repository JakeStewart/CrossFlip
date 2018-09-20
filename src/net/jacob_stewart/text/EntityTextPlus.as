package net.jacob_stewart.entity_text 
{
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	import net.js.EntityPlus;
	import net.js.JS;
	import net.js.WorldPlus;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class EntityTextPlus extends EntityGame 
	{
		public var front:EntityText;
		public var back:EntityText;
		public var list:Array = new Array;
		
		public var textWidth:uint;
		public var textHalfWidth:Number;
		public var textHeight:uint;
		public var textHalfHeight:Number;
		
		
		public var textStr:String;
		public var size:uint;
		public var backOffset:uint;
		public var backAlpha:Number;
		
		
		public var fontList:Array = ["default", "Arial", "Courier"];
		public const FONTINDEX:uint = 0;
		
		
		
		public function EntityTextPlus(textStr:String = "text", fontIndex:uint = 0, size:uint = 16, x:Number=0, y:Number=0, alignX:Number = 0, alignY:Number = 0, layer:int = 0, frontColor:uint = JS.WHITE, frontAlpha:Number = 1, useBack:Boolean = true, backOffset:uint = 2, backColor:uint = JS.BLACK, backAlpha:Number = 1) 
		{
			this.textStr = textStr;
			this.size = size;
			this.backOffset = backOffset;
			this.backAlpha = backAlpha;
			this.layer = layer;
			
			
			if (useBack) back = new EntityText(this.textStr, fontList[fontIndex], this.size, x, y, alignX, alignY, backOffset, backColor, this.backAlpha, this.layer);
			front = new EntityText(this.textStr, fontList[fontIndex], this.size, x, y, alignX, alignY, 0, frontColor, frontAlpha, this.layer);
			
			this.x = front.x, this.y = front.y;
			
			if (x == -2) alignLeft(alignX);
			if (x == -3) alignCenter(alignX);
			if (x == -4) alignRight(alignX);
			
			
			// front.text.font = fontList[FONTINDEX];
			// back.text.font = fontList[FONTINDEX];
			
			
			super(this.x, this.y);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			// wpWorld = FP.world as WorldPlus;
			// wpWorld.children.push(this, back, front);
			
			list.push(front);
			addList.push(front);
			if (back) list.unshift(back), addList.unshift(back);
			addList.unshift(this);
			
			setDimensionalVals();
			setHomeCoords(x, y);
		}
		
		override public function added():void 
		{
			super.added();
			
			
			// epAddList(list);
		}
		// -------------------------------------------------------------------------
		
		
		public function setCoords(x:Number=0, y:Number=0):void
		{
			this.x = x, this.y = y;
			front.x = this.x, front.y = this.y;
			if (back) back.x = this.x + backOffset, back.y = this.y + backOffset;
		}
		
		public function setHomeCoords(x:Number=0, y:Number=0):void
		{
			homeCoords.x = x, homeCoords.y = y;
			front.homeCoords.x = x, front.homeCoords.y = y;
			if (back) back.homeCoords.x = x + backOffset, back.homeCoords.y = y + backOffset;
		}
		// -------------------------------------------------------------------------
		
		
		override public function centerHor(width:uint, alignX:Number):Number 
		{
			super.centerHor(width, alignX);
			setCoords(x, y);
			return x;
		}
		
		override public function centerVer(height:uint, alignY:Number):Number 
		{
			super.centerVer(height, alignY);
			setCoords(x, y);
			return y;
		}
		
		override public function centerOnPoint(width:uint, height:uint, pX:Number, pY:Number):void 
		{
			super.centerOnPoint(width, height, pX, pY);
			setCoords(x, y);
		}
		// -------------------------------------------------------------------------
		
		
		public function alignLeft(alignX:Number):void
		{
			x = alignX;
			setCoords(x, y);
		}
		
		public function alignCenter(alignX:Number):void
		{
			centerHor(front.text.textWidth, alignX);
			setCoords(x, y);
		}
		
		public function alignRight(alignX:Number):void
		{
			x = alignX - front.text.textWidth;
			setCoords(x, y);
		}
		// -------------------------------------------------------------------------
		
		
		public function changeText(newText:String, alignCenter:Boolean = true, alignRight:Boolean = false):void
		{
			var centerX:Number = x + textHalfWidth;
			var rightX:Number = x + textWidth;
			
			textStr = newText;
			front.text.text = textStr;
			if (back) back.text.text = textStr;
			setDimensionalVals();
			
			if (alignCenter) this.alignCenter(centerX);
			else if (alignRight) this.alignRight(rightX);
			
			setCoords(x, y);
		}
		
		public function changeSize(size:uint):void
		{
			var centerPoint:Point = new Point(x + textHalfWidth, y + textHalfHeight);
			
			this.size = size;
			front.text.size = this.size;
			if (back) back.text.size = this.size;
			
			setDimensionalVals();
			centerOnPoint(textWidth, textHeight, centerPoint.x, centerPoint.y);
			
			setCoords(x, y);
		}
		
		
		public function changeColor(frontColor:uint = JS.WHITE, backColor:uint = JS.BLACK):void
		{
			front.text.color = frontColor;
			if (back) back.text.color = backColor;
		}
		
		public function changeAlpha(frontAlpha:Number = -1, backAlpha:Number = -1):void
		{
			if (frontAlpha > -1) front.text.alpha = frontAlpha;
			if (back && backAlpha > -1) back.text.alpha = backAlpha;
		}
		
		
		public function changeLayer(layer:int):void
		{
			this.layer = layer;
			if (back) back.layer = this.layer;
			front.layer = this.layer;
		}
		
		public function bringToFront():void
		{
			if (back) world.bringToFront(back);
			world.bringToFront(front);
			world.bringToFront(this);
		}
		
		public function setStyle():void
		{
			
			
			/*
			tp.text.setStyle("color", { color: INFOTEXTCOLOR } );
			tp.text.richText = "<color>" + tp.text.text + "</color>";
			if (tp.text.width > 560) tp.text.wordWrap = true, tp.text.width = 560;
			*/
			
			
		}
		// -------------------------------------------------------------------------
		
		
		public function setDimensionalVals():void
		{
			textWidth = front.text.textWidth;
			textHalfWidth = textWidth * .5;
			textHeight = front.text.textHeight;
			textHalfHeight = textHeight * .5;
		}
		// -------------------------------------------------------------------------
		
		
		/*
		public function tweenText(tweenProp:String, to:Number, duration:Number, ease:Function = null):Array
		{
			var varTweenList:Array = new Array(3);
			
			varTweenList[0] = tweenVar(this, tweenProp, to, duration, ease);
			varTweenList[1] = tweenVar(front, tweenProp, to, duration, ease);
			varTweenList[2] = tweenVar(back, tweenProp, to + backOffset, duration, ease);
			
			
			return varTweenList;
		}
		*/
		
		
		// -------------------------------------------------------------------------
		
	}

}