function checkPw() {
			var pw = document.getElementById('registPW').value;
			if (pw.length > 8) {
				window.alert('비밀번호는 8자내로 작성해주세요');
				document.getElementById('registPW').value = '';
			}
			if (pw != '' && document.getElementById('checkPW').value != '') {
				if (pw == document.getElementById('checkPW').value) {
					window.alert('비밀번호 일치');
				} else {
					window.alert('비밀번호 불일치');
					document.getElementById('checkPW').value = '';
				}
			}
		}
