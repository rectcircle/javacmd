package cn.rectcircle.javacmd;

import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import com.google.common.base.Joiner;

public class Main {

	public static void main(String[] args) {
		List<String> list = Arrays.asList("a", "b", "c");
		System.out.println(StringUtils.join(list,","));
		System.out.println(Joiner.on(",").join(list));
	}
}