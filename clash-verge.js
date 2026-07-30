// 昆仑云订阅扩展脚本：AI 策略组 + AI 规则
// fallback 优先级：日本 > 新加坡 > 韩国（按节点名关键字匹配）

const AI_GROUP = "AI";

// 匹配优先级：越靠前越优先；同关键字内保持订阅原顺序
const REGION_KEYWORDS = ["日本", "新加坡", "韩国"];

const AI_RULES = [
  "DOMAIN-SUFFIX,chatgpt.com,AI",
  "DOMAIN-SUFFIX,openai.com,AI",
  "DOMAIN-SUFFIX,claude.ai,AI",
  "DOMAIN-SUFFIX,googleapis.com,AI",
];

// AI 策略组配置（proxies 在 main 里按关键字填入）
const AI_GROUP_OPTION = {
  name: AI_GROUP,
  type: "fallback",
  url: "http://www.gstatic.com/generate_204",
  interval: 300,
};

function pickProxiesByRegions(proxies, keywords) {
  const names = (proxies || [])
    .map((p) => p && p.name)
    .filter((name) => typeof name === "string" && name.length > 0);

  const selected = [];
  const used = new Set();

  for (const kw of keywords) {
    for (const name of names) {
      if (used.has(name)) continue;
      if (name.includes(kw)) {
        selected.push(name);
        used.add(name);
      }
    }
  }

  return selected;
}

function main(config, profileName) {
  const proxies = pickProxiesByRegions(config.proxies, REGION_KEYWORDS);

  if (proxies.length === 0) {
    return config;
  }

  // 1) 写入 / 覆盖 AI 策略组
  const aiGroup = Object.assign({}, AI_GROUP_OPTION, { proxies: proxies });
  const groups = (config["proxy-groups"] || []).filter(
    (g) => !g || g.name !== AI_GROUP
  );
  groups.push(aiGroup);
  config["proxy-groups"] = groups;

  // 2) 去掉我们上次加的 AI 规则，再 prepend 到最前
  const aiRuleSet = new Set(AI_RULES);
  const oldRules = config["rules"] || [];
  const cleaned = oldRules.filter((rule) => !aiRuleSet.has(rule));
  config["rules"] = AI_RULES.concat(cleaned);

  return config;
}
