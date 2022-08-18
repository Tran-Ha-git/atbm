import java.awt.Color;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

import javax.crypto.SecretKey;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.border.EmptyBorder;

import exam.edu.utils.RSAUtil;

public class CreatingDigitalSignature extends JFrame {
	private Image img = Toolkit.getDefaultToolkit().getImage("images/background.png");
	private JLabel lblKey, lblHashCode, lblSignature;
	private JPanel contentPane;
	private JTextArea textAreaPrivateKey, textHashCode, textSignature;
	private JButton button;

	public CreatingDigitalSignature() throws IOException {

		this.setContentPane(new JPanel() {
			@Override
			public void paintComponent(Graphics g) {
				super.paintComponent(g);
				g.drawImage(img, 0, 0, this);
			}
		});
		setLayout(null);
		// Code View
		ImageIcon imgicon = new ImageIcon("images/lock.png");
		setIconImage(imgicon.getImage());
		setBounds(100, 100, 909, 249);

		this.lblKey = new JLabel("Private Key : ");
		this.lblKey.setBounds(30, 120, 230, 35);
		lblKey.setForeground(Color.WHITE);
		lblKey.setFont(new Font("Serif", Font.BOLD, 30));
		this.add(lblKey);

		this.textAreaPrivateKey = new JTextArea();
		this.textAreaPrivateKey.setBounds(200, 120, 350, 50);
		this.textAreaPrivateKey.setForeground(Color.DARK_GRAY);
		this.textAreaPrivateKey.setFont(new Font("Serif", Font.BOLD, 25));

		this.lblHashCode = new JLabel("Hash Code : ");
		this.lblHashCode.setBounds(30, 240, 230, 35);
		lblHashCode.setForeground(Color.WHITE);
		lblHashCode.setFont(new Font("Serif", Font.BOLD, 30));
		this.add(lblHashCode);

		this.textHashCode = new JTextArea();
		this.textHashCode.setBounds(200, 240, 350, 50);
		this.textHashCode.setForeground(Color.DARK_GRAY);
		this.textHashCode.setFont(new Font("Serif", Font.BOLD, 25));

		this.button = new JButton("GET SIGNATURE!");
		this.button.setBounds(280, 300, 180, 30);
		this.button.setForeground(Color.GRAY);
		this.button.setFont(new Font("Serif", Font.BOLD, 15));
		this.add(button);

		this.lblSignature = new JLabel("Signature : ");
		this.lblSignature.setBounds(30, 360, 230, 35);
		lblSignature.setForeground(Color.WHITE);
		lblSignature.setFont(new Font("Serif", Font.BOLD, 30));
		this.add(lblSignature);

		this.textSignature = new JTextArea();
		this.textSignature.setBounds(200, 360, 350, 50);
		this.textSignature.setForeground(Color.DARK_GRAY);
		this.textSignature.setFont(new Font("Serif", Font.BOLD, 25));

		JScrollPane pane1 = new JScrollPane();
		pane1.setViewportView(textAreaPrivateKey);
		pane1.setBounds(200, 120, 350, 50);
		this.add(pane1);

		JScrollPane pane2 = new JScrollPane();
		pane2.setViewportView(textHashCode);
		pane2.setBounds(200, 240, 350, 50);
		this.add(pane2);

		JScrollPane pane3 = new JScrollPane();
		pane3.setViewportView(textSignature);
		pane3.setBounds(200, 360, 350, 50);
		this.add(pane3);

		//Xử lý sự kiện
		this.button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {

					String msg = textHashCode.getText();
					String strPriKey = textAreaPrivateKey.getText();

					// Creating a Signature object
					String signature = Base64.getEncoder().encodeToString(RSAUtil.encryptByPrivateKey(msg, strPriKey));

					textSignature.setText(signature);

				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
	}

	public static PrivateKey getPrivateKey(String base64PrivateKey) {
		PrivateKey privateKey = null;
		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(base64PrivateKey.getBytes()));
		KeyFactory keyFactory = null;
		try {
			keyFactory = KeyFactory.getInstance("RSA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		try {
			privateKey = keyFactory.generatePrivate(keySpec);
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return privateKey;
	}

	public static void main(String[] args) throws Exception {
		CreatingDigitalSignature jf = new CreatingDigitalSignature();
		jf.setTitle("Creating Digital Signature");
		jf.setDefaultCloseOperation(3);
		jf.setSize(900, 562);
		jf.setVisible(true);
	}
}
