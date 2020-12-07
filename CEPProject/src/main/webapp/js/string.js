var value = value || {};
value.string = (function(){
	
	return  {
		isEmpty : function(str){
			return str === null || str === undefined ? true: /^[\s\xa0]*$/.test(str);
		},
		isLower : function(str){
			return string.isAlpha(str) && str.toLowerCase() === str;
		},
		isUpper : function(str){
			return string.isAlpha(str) && str.toUpperCase() === str;
		},
		// 사업자등록번호 검사 
		isBizNo : function(bizID) {
			// bizID는 숫자만 10자리로 해서 문자열로 넘긴다.
			var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);
			var i, chkSum=0, c2, remander;
			
			bizID = bizID.replace(/-/gi, '');
		
			for (i = 0; i <= 7; i++) {
				chkSum += checkID[i] * bizID.charAt(i);
			}
			c2 = "0" + (checkID[8] * bizID.charAt(8));
			c2 = c2.substring(c2.length - 2, c2.length);
			
			chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));
			remander = (10 - (chkSum % 10)) % 10 ;
			
			if (Math.floor(bizID.charAt(9)) == remander) return true; // OK!
			return false;
		},

	}
})();