import '../models/question.dart';

final List<Question> questions = [
  Question(
    text: 'You are the project manager for a team working on a high-stakes project. One of your team members, who is highly skilled but often misses deadlines, asks you to give them an extension on their current task. Do you:',
    options: [
      'Give them the extension because their skills are crucial to the project, even though it might set a precedent for leniency.',
      'Refuse the extension and enforce the deadline strictly, emphasizing the importance of meeting deadlines to maintain team discipline.'
    ],
    correctOption: 'Refuse the extension and enforce the deadline strictly, emphasizing the importance of meeting deadlines to maintain team discipline.',
    explanation: 'Enforcing deadlines helps maintain team discipline and ensures that everyone understands the importance of timely completion of tasks.',
  ),
  Question(
    text: 'As a teacher, you notice that one of your students has been unusually quiet and withdrawn lately. After class, they confide in you that they are struggling with personal issues at home. Do you:',
    options: [
      'Offer to extend deadlines for their assignments and provide additional support to help them cope during this difficult time.',
      'Encourage them to maintain their academic performance and refer them to the school counselor for professional support.'
    ],
    correctOption: 'Offer to extend deadlines for their assignments and provide additional support to help them cope during this difficult time.',
    explanation: 'Offering extensions and support shows empathy and helps the student manage their personal challenges without compromising their education.',
  ),
  Question(
    text: 'You are a journalist with information that could potentially expose corruption within a major corporation. However, releasing this information could endanger your source. Do you:',
    options: [
      'Publish the story immediately to inform the public, regardless of the potential risk to your source.',
      'Hold off on publishing until you can ensure your source’s safety, even if it means delaying the exposure of the corruption.'
    ],
    correctOption: 'Hold off on publishing until you can ensure your source’s safety, even if it means delaying the exposure of the corruption.',
    explanation: 'Protecting your source’s safety is paramount and demonstrates ethical responsibility in journalism.',
  ),
  Question(
    text: 'You are in charge of hiring for a critical position in your company. One of the candidates is a close friend who meets the qualifications but is not the strongest candidate. Do you:',
    options: [
      'Hire your friend to maintain loyalty and trust, believing they will grow into the role with proper training.',
      'Hire the strongest candidate to ensure the best fit for the company, maintaining objectivity and fairness in the hiring process.'
    ],
    correctOption: 'Hire the strongest candidate to ensure the best fit for the company, maintaining objectivity and fairness in the hiring process.',
    explanation: 'Hiring the strongest candidate ensures that the company benefits from the best talent, maintaining fairness and objectivity in the hiring process.',
  ),
  Question(
    text: 'You are a doctor with a patient who refuses a life-saving treatment due to personal beliefs. Do you:',
    options: [
      'Respect their decision, understanding the importance of personal autonomy and the right to make their own health decisions.',
      'Try to persuade them to accept the treatment, emphasizing the potential to save their life and improve their health.'
    ],
    correctOption: 'Respect their decision, understanding the importance of personal autonomy and the right to make their own health decisions.',
    explanation: 'Respecting the patient’s autonomy is crucial in healthcare, even if their decision goes against medical advice.',
  ),
  Question(
    text: 'You are leading a team on a tight deadline when one of your members makes a significant mistake. Addressing it publicly could motivate the team to avoid similar errors, but it could also embarrass the individual. Do you:',
    options: [
      'Address the mistake publicly to reinforce the importance of accuracy and adherence to procedures, promoting a culture of accountability.',
      'Discuss the mistake privately with the team member to avoid public embarrassment while ensuring they understand and learn from the error.'
    ],
    correctOption: 'Discuss the mistake privately with the team member to avoid public embarrassment while ensuring they understand and learn from the error.',
    explanation: 'Addressing the mistake privately helps maintain the individual’s dignity and promotes a supportive team environment.',
  ),
  Question(
    text: 'As a senior employee, you notice that a colleague has been taking credit for work done by others. This has been boosting their career at the expense of others. Do you:',
    options: [
      'Confront your colleague directly and inform them that their behavior is unethical and unacceptable.',
      'Report the behavior to your supervisor, providing evidence and ensuring the issue is addressed through formal channels.'
    ],
    correctOption: 'Report the behavior to your supervisor, providing evidence and ensuring the issue is addressed through formal channels.',
    explanation: 'Reporting the behavior through formal channels ensures that the issue is handled appropriately and maintains professional standards.',
  ),
  Question(
    text: 'You are working in a competitive sales environment. Your competitor offers you confidential information about their strategies, which could give you an advantage. Do you:',
    options: [
      'Use the information to gain an edge in the market, believing it’s a common practice in a competitive environment.',
      'Refuse the information and inform your competitor that you will compete fairly based on your own strategies and capabilities.'
    ],
    correctOption: 'Refuse the information and inform your competitor that you will compete fairly based on your own strategies and capabilities.',
    explanation: 'Refusing to use confidential information demonstrates ethical behavior and maintains integrity in a competitive environment.',
  ),
  Question(
    text: 'You are a software developer who discovers a major security flaw in your company’s product that could potentially affect millions of users. Fixing it would delay the product launch. Do you:',
    options: [
      'Inform your superiors and advocate for fixing the flaw before launch, prioritizing user safety over the release schedule.',
      'Keep quiet and proceed with the launch as planned, believing that addressing the flaw later would be less disruptive.'
    ],
    correctOption: 'Inform your superiors and advocate for fixing the flaw before launch, prioritizing user safety over the release schedule.',
    explanation: 'Prioritizing user safety and addressing the security flaw before launch demonstrates responsibility and ethical conduct in software development.',
  ),
  Question(
    text: 'You are in charge of a community project and have limited resources. You can either use the funds to benefit a small group in need significantly or spread the resources thinly to benefit a larger group marginally. Do you:',
    options: [
      'Allocate the funds to benefit the small group significantly, believing that making a substantial difference for some is better than a marginal impact for many.',
      'Spread the resources thinly to benefit a larger group, aiming to reach as many people as possible, even if the impact is minimal.'
    ],
    correctOption: 'Allocate the funds to benefit the small group significantly, believing that making a substantial difference for some is better than a marginal impact for many.',
    explanation: 'Making a substantial difference for a small group can have more profound and lasting effects, demonstrating a focused and impactful approach to resource allocation.',
  ),
];
