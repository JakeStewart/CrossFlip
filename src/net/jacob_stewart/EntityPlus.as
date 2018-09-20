package net.jacob_stewart 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class EntityPlus extends Entity 
	{
		public var hbWidth:uint = 0;
		public var hbHeight:uint = 0;
		public var hbOriginX:int = 0;
		public var hbOriginY:int = 0;
		
		public var homeCoords:Point = new Point;
		
		public var addList:Array = new Array;
		public var children:Array = new Array;
		
		
		
		public function EntityPlus(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = 0) 
		{
			super(x, y, graphic);
			
			
			this.layer = layer;
			init();
		}
		
		public function init():void
		{
			type = "EntityPlus";
		}
		
		override public function added():void 
		{
			super.added();
			
			
			if (name == null) name = type + world.typeCount(type).toString();
		}
		
		override public function removed():void 
		{
			super.removed();
			
			
			world.removeList(children);
			children.length = 0;
		}
		// -------------------------------------------------------------
		
		
		public function setup(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int = 0):EntityPlus
		{
			this.x = x, this.y = y;
			if (graphic != null) this.graphic = graphic;
			this.layer = layer;
			
			
			return this;
		}
		
		public function epSetHitBox(width:uint = 0, height:uint = 0, originX:int = 0, originY:int = 0):void
		{
			hbWidth = width;
			hbHeight = height;
			hbOriginX = originX;
			hbOriginY = originY;
			
			setHitbox(width, height, originX, originY);
		}
		
		public function epSetHitBoxTo(o:Object):void
		{
			if (o is Image || o is Rectangle) epSetHitBox(o.width, o.height, -o.x, -o.y);
			else
			{
				if (o.hasOwnProperty("width")) width = o.width;
				if (o.hasOwnProperty("height")) height = o.height;
				if (o.hasOwnProperty("originX") && !(o is Graphic)) originX = o.originX;
				else if (o.hasOwnProperty("x")) originX = -o.x;
				if (o.hasOwnProperty("originY") && !(o is Graphic)) originX = o.originY;
				else if (o.hasOwnProperty("y")) originX = -o.y;
				
				
				hbWidth = width;
				hbHeight = height;
				hbOriginX = originX;
				hbOriginY = originY;
			}
		}
		// -------------------------------------------------------------
		
		public function setXY(x:Number, y:Number):void
		{
			this.x = x, this.y = y;
		}
		
		public function setHomeXY(x:Number, y:Number):void
		{
			homeCoords.x = x, homeCoords.y = y;
		}
		
		public function centerHor(width:uint, alignX:Number):Number
		{
			x = alignX - (width * .5);
			return x;
		}
		
		public function centerVer(height:uint, alignY:Number):Number
		{
			y = alignY - (height * .5);
			return y;
		}
		
		public function centerOnPoint(width:uint, height:uint, pX:Number, pY:Number):void
		{
			x = pX - (width * .5);
			y = pY - (height * .5);
		}
		// -------------------------------------------------------------
		
		
		public function addToChildren(list:Array):void
		{
			for (var i:uint = 0; i < list.length; i++)
			{
				if (list[i] is Array) addToChildren(list[i]);
				else children.push(list[i]);
			}
		}
		
		public function removeFromChildren(list:Array):void
		{
			for (var i:uint = 0; i < list.length; i++)
			{
				if (list[i] is Array) removeFromChildren(list[i]);
				else if (list[i] is Entity) children.splice(children.indexOf(list[i]), 1);
			}
		}
		// -------------------------------------------------------------
		
		
		public function epAdd(e:Entity):Entity
		{
			if (children.indexOf(e) == -1) children.push(e);
			return world.add(e);
		}
		
		public function epAddList(list:Array):void
		{
			for (var i:uint = 0; i < list.length; i++)
			{
				if (list[i] is Array) epAddList(list[i]);
				else if (list[i] is Entity) epAdd(list[i]);
			}
		}
		
		public function epRemove(e:Entity):void
		{
			JS.splice(children, e);
			if (e.world) world.remove(e);
		}
		
		public function epRemoveList(list:Array):void
		{
			for (var i:uint = 0; i < list.length; i++)
			{
				if (list[i] is Array) epRemoveList(list[i]);
				else if (list[i] is Entity) epRemove(list[i]);
			}
		}
		
		public function epCreate(_class:Class):Entity
		{
			var e:Entity = world.create(_class);
			if (children.indexOf(e) == -1) children.push(e);
			return e;
		}
		
		public function epRecycle(e:Entity):void
		{
			JS.splice(children, e);
			if (e.world) world.recycle(e);
		}
		
		
		// When using alarm to remove yourself
		public function removeThis():void
		{
			if (world) world.remove(this);
		}
		
		// When using alarm to recycle yourself
		public function recycleThis():void
		{
			if (world) world.recycle(this);
		}
		// -------------------------------------------------------------
		
		
		/**
		 * Turns the update on or off for all children (all children of this EntityPlus)
		 * @param	state			The active state for each EntityPlus
		 * @param	includeThis		Optional Boolean if 'this' should be included on not
		 * @param	exclude			Optional one or multidimensional array of children to exclude
		 */
		public function epActive(state:Boolean, includeThis:Boolean = true, exclude:Array = null):void
		{
			var ep:EntityPlus;
			var entities:Array = JS.getArrayAsFlat(children);
			
			if (exclude != null)
			{
				exclude = JS.getArrayAsFlat(exclude);
				for each (ep in exclude) entities.splice(entities.indexOf(ep), 1);
			}
			
			if (includeThis) active = state;
			for each (ep in entities) ep.epActive(state, true, exclude);
		}
		
		
		/**
		 * Turns the render on or off for all children (all children of this EntityPlus)
		 * @param	state			The render state for each EntityPlus
		 * @param	includeThis		Optional Boolean if 'this' should be included on not
		 * @param	exclude			Optional one or multidimensional array of children to exclude
		 */
		public function epVisible(state:Boolean, includeThis:Boolean = true, exclude:Array = null):void
		{
			var ep:EntityPlus;
			var entities:Array = JS.getArrayAsFlat(children);
			
			if (exclude != null)
			{
				exclude = JS.getArrayAsFlat(exclude);
				for each (ep in exclude) entities.splice(entities.indexOf(ep), 1);
			}
			
			if (includeThis) visible = state;
			for each (ep in entities) ep.epVisible(state, true, exclude);
		}
		
		
		/**
		 * Turns the collision on or off for all children (all children of this EntityPlus)
		 * @param	state			The collision state for each EntityPlus
		 * @param	includeThis		Optional Boolean if 'this' should be included on not
		 * @param	exclude			Optional one or multidimensional array of children to exclude
		 */
		public function epCollidable(state:Boolean, includeThis:Boolean = true, exclude:Array = null):void
		{
			var ep:EntityPlus;
			var entities:Array = JS.getArrayAsFlat(children);
			
			if (exclude != null)
			{
				exclude = JS.getArrayAsFlat(exclude);
				for each (ep in exclude) entities.splice(entities.indexOf(ep), 1);
			}
			
			if (includeThis) collidable = state;
			for each (ep in entities) ep.epCollidable(state, true, exclude);
		}
		
		
		/**
		 * Turns the collision and render on or off for all children (all children of this EntityPlus)
		 * @param	state			The collision and render state for each EntityPlus
		 * @param	includeThis		Optional Boolean if 'this' should be included on not
		 * @param	exclude			Optional one or multidimensional array of children to exclude
		 */
		public function epCollidableAndVisible(state:Boolean, includeThis:Boolean = true, exclude:Array = null):void
		{
			var ep:EntityPlus;
			var entities:Array = JS.getArrayAsFlat(children);
			
			if (exclude != null)
			{
				exclude = JS.getArrayAsFlat(exclude);
				for each (ep in exclude) entities.splice(entities.indexOf(ep), 1);
			}
			
			if (includeThis) collidable = state, visible = state;
			for each (ep in entities) ep.epCollidableAndVisible(state, true, exclude);
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}